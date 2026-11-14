# USD Tracker API

Express 5 + TypeScript API on Bun. It fetches **Frankfurter** rates on demand,
stores changes in **Turso/libSQL via Drizzle ORM**, and sends **Firebase Cloud
Messaging** alerts to the Android app.

There is **no in-process scheduler**. An external cron service calls a secured
HTTP endpoint; this keeps the API compatible with serverless/edge schedulers and
lets you deploy the web process without a background loop.

## Stack

| Concern      | Choice                                              |
| ------------ | --------------------------------------------------- |
| Runtime      | Bun 1.4 locally; Node 20+ on Vercel                 |
| HTTP         | Express 5, feature-first routers                    |
| Validation   | Zod 4                                               |
| Persistence  | Turso Cloud / libSQL + Drizzle ORM 0.45             |
| Migrations   | drizzle-kit generate → applied on boot              |
| Push         | `firebase-admin` → FCM HTTP v1                      |
| Scheduling   | external cron → `/api/v1/cron/rates` (no `cron` pkg)|
| Tests        | Bun test + supertest                                |
| Deploy       | Docker or Vercel (`api/index.ts` + Vercel Cron)      |

## Quick start

```bash
cd backend
bun install
cp .env.example .env

# set API_KEY and CRON_SECRET in .env, and the Firebase base64 credential
# local default DB is a libSQL file: file:./data/usd-tracker.db
bun run dev                     # http://localhost:3000/api/v1

# trigger a poll manually (this is what the external cron does)
curl -X POST -H "x-cron-secret: $CRON_SECRET" \
  http://localhost:3000/api/v1/cron/rates
```

The API has **no automatic startup poll**. Until the cron endpoint is called,
`/health` reports `degraded` and rates are empty; that is expected.

### Commands

```bash
bun run dev        # watch mode
bun run build      # tsc → dist/
bun run start:prod # bun dist/server.js
bun run typecheck
bun test           # 11 unit tests
bun run test:e2e   # 6 HTTP tests (in-memory SQLite + fake provider)
bun run db:generate
bun run db:studio
```

## External cron

The scheduler service sends the secret in either header:

```http
X-Cron-Secret: <CRON_SECRET>
Authorization: Bearer <CRON_SECRET>
```

| Method | Path                     | Purpose                          |
| ------ | ------------------------ | -------------------------------- |
| GET/POST | `/api/v1/cron/rates`   | fetch rates, evaluate alerts, push |
| GET/POST | `/api/v1/cron/maintenance` | apply history/notification retention |

Both GET and POST are supported so Vercel Cron, cron-job.org, EasyCron, GitHub
Actions, or a shell crontab work without adapters.

```bash
# poll every minute
curl -fsS -X POST \
  -H "X-Cron-Secret: $CRON_SECRET" \
  https://api.example.com/api/v1/cron/rates

# retention once a day
curl -fsS -X POST \
  -H "X-Cron-Secret: $CRON_SECRET" \
  https://api.example.com/api/v1/cron/maintenance
```

Crontab:

```cron
* * * * * curl -fsS -X POST -H "X-Cron-Secret: $CRON_SECRET" https://api.example.com/api/v1/cron/rates >> /var/log/usd-rates.log 2>&1
15 3 * * * curl -fsS -X POST -H "X-Cron-Secret: $CRON_SECRET" https://api.example.com/api/v1/cron/maintenance >> /var/log/usd-maintenance.log 2>&1
```

Vercel `vercel.json`:

```json
{
  "crons": [
    { "path": "/api/v1/cron/rates", "schedule": "* * * * *" },
    { "path": "/api/v1/cron/maintenance", "schedule": "15 3 * * *" }
  ]
}
```

Vercel Cron sends `Authorization: Bearer $CRON_SECRET` automatically when a
`CRON_SECRET` environment variable exists. If `CRON_SECRET` is unset, the
endpoint returns `503`; there is no open cron route.

If a poll overlaps the previous one, it returns `status: "skipped"` instead of
stacking work. Provider failures return `502`; the last poll state is still
stored in `app_state.last_poll` and visible in `/health`.

## API

Base path: `/api/v1`. Admin routes require `X-API-Key` **when `API_KEY` is set**;
cron routes always require `CRON_SECRET`.

| Method | Path                        | Auth   | Purpose                          |
| ------ | --------------------------- | ------ | -------------------------------- |
| GET    | `/health`                   | —      | DB, FCM, last poll, device count |
| GET    | `/rates`                    | —      | Latest rate per tracked quote    |
| GET    | `/rates/:quote`             | —      | Latest + previous/change         |
| GET    | `/rates/:quote/history`     | —      | Stored changes, oldest → newest  |
| POST   | `/rates/refresh`            | API key| Force a poll now                 |
| POST   | `/rates/:quote/backfill`    | API key| Import up to 7 days of history   |
| GET/POST | `/cron/rates`             | Cron   | External scheduled poll          |
| GET/POST | `/cron/maintenance`       | Cron   | Retention cleanup                |
| POST   | `/devices`                  | API key| Register/refresh FCM token       |
| GET    | `/devices`                  | API key| List (masked tokens)             |
| DELETE | `/devices/:token`           | API key| Unregister                       |
| GET/POST/PATCH/DELETE | `/alerts[/:id]` | API key| Threshold alert rules           |
| GET    | `/notifications`            | API key| Push delivery log                |
| POST   | `/notifications/test`       | API key| Send a test push                 |

Examples:

```bash
curl http://localhost:3000/api/v1/rates/NPR

curl -X POST -H "x-api-key: $API_KEY" \
  http://localhost:3000/api/v1/rates/refresh

curl -X POST -H "content-type: application/json" -H "x-api-key: $API_KEY" \
  -d '{"token":"<fcm-token>","platform":"android","quote":"NPR"}' \
  http://localhost:3000/api/v1/devices

curl -X POST -H "content-type: application/json" -H "x-api-key: $API_KEY" \
  -d '{"quote":"NPR","condition":"below","threshold":140}' \
  http://localhost:3000/api/v1/alerts
```

Alerts are edge-triggered: a push fires when the rate crosses the threshold, not
on every poll. `SIGNIFICANT_CHANGE_PERCENT` adds a push for large moves;
`NOTIFY_EVERY_TICK=true` sends on every poll.

> Alerts are currently **global** (not per device/user). Multiple app users share
> the same alert list and all devices for a quote receive a triggered alert. Per-
> device ownership is the next schema change if that is required.

## Configuration

See [`.env.example`](./.env.example). Important values:

| Variable                     | Default                 | Notes                              |
| ---------------------------- | ----------------------- | ---------------------------------- |
| `BASE_CURRENCY`              | `USD`                   | ISO-4217 base                      |
| `TRACKED_QUOTES`             | `NPR`                   | Comma-separated quotes             |
| `TURSO_DATABASE_URL`         | `file:./data/usd-tracker.db` | Turso URL or local libSQL file |
| `TURSO_AUTH_TOKEN`           | empty                   | Turso token (not needed for file)  |
| `API_KEY`                    | empty                   | Empty = admin routes public (dev)  |
| `CRON_SECRET`                | empty                   | Required for `/cron/*`; 503 if empty|
| `NOTIFY_EVERY_TICK`          | `false`                 | Push every poll                    |
| `SIGNIFICANT_CHANGE_PERCENT` | `0.5`                   | `0` disables                       |
| `ALERT_COOLDOWN_SECONDS`     | `21600`                 | Default for new rules              |
| `FIREBASE_SERVICE_ACCOUNT_*` | empty                   | Base64/JSON/path                   |
| `HISTORY_RETENTION_DAYS`     | `7`                     | Rate history window                |

## Firebase

The backend needs a **service account private key**, not the Android
`google-services.json`.

Local:

```bash
# backend/secrets/firebase-service-account.json (git-ignored)
FIREBASE_SERVICE_ACCOUNT_PATH=./secrets/firebase-service-account.json
```

Deployed/serverless (base64):

```bash
base64 -i secrets/firebase-service-account.json | tr -d '\n'
```

Set `FIREBASE_SERVICE_ACCOUNT_BASE64` (sensitive) and leave the path empty.
`FIREBASE_SERVICE_ACCOUNT_JSON` is also supported. Check `/health`:
`fcm.configured` must be `true`.

The Android app's `google-services.json` lives at
`app/android/app/google-services.json`; it is client config, not a backend
credential.

## Data & retention

Tables: `rate_snapshots` (only changed values), `devices`, `alert_rules`,
`notifications`, `app_state`. Retention is **7 days** by default:
`HISTORY_RETENTION_DAYS=7` and `NOTIFICATION_RETENTION_DAYS=7`.

Old rows are pruned **on server startup** and at the start of **every poll**, so
`/cron/rates` keeps the database at seven days even if you do not schedule
`/cron/maintenance`. The maintenance endpoint remains available for an explicit
cleanup. Backfill is capped to the same window, so the app can never import more
than seven days.

## Docker

```bash
cp .env.example .env
docker compose up --build -d
# external cron calls the published endpoints; the container does not schedule
```

With the default `file:` URL, libSQL lives in the `usd-tracker-data` volume. For
Turso Cloud, set `TURSO_DATABASE_URL` and `TURSO_AUTH_TOKEN`; no volume is
needed. The image runs `bun dist/server.js`.

## Turso Cloud

Create the database and token:

```bash
turso db create usd-tracker
turso db show usd-tracker --url          # libsql://...
turso db tokens create usd-tracker       # token
```

Set:

```env
TURSO_DATABASE_URL=libsql://<db>-<org>.turso.io
TURSO_AUTH_TOKEN=<token>
```

Apply migrations once (or let the app auto-migrate on boot):

```bash
TURSO_DATABASE_URL=... TURSO_AUTH_TOKEN=... bun run db:migrate
```

The local `file:./data/usd-tracker.db` default needs no token and is ignored by
git.

## Vercel

Vercel is supported with Turso Cloud (not the local `file:` URL):

1. In Vercel, set **Root Directory = `backend`** and **Framework Preset = Other**.
   Do not select the Bun preset: it expects a `Bun.serve()` server and ignores
   `api/index.ts`, producing `Invalid export found ... src/app.js`.
   `src/app.ts` now also has a lazy default Express export, so zero-config
   Express detection works as a fallback. `vercel.json` sets `"framework": null`.
2. Add environment variables: `TURSO_DATABASE_URL`, `TURSO_AUTH_TOKEN`,
   `API_KEY`, `CRON_SECRET` and `FIREBASE_SERVICE_ACCOUNT_BASE64`.
3. Apply migrations against Turso (`bun run db:migrate` with the Turso env).
4. Deploy. `vercel.json` routes all requests to `api/index.ts` and schedules:
   - `/api/v1/cron/rates` every minute
   - `/api/v1/cron/maintenance` at 03:15
5. Vercel sends `Authorization: Bearer $CRON_SECRET` to cron routes, so
   `CRON_SECRET` must be set in Vercel.

`vercel.json` sets `"framework": null` to keep Vercel on the Node.js function
runtime. `includeFiles: ["drizzle/**"]` bundles migrations if you need
auto-migrate at runtime; for lower cold-start cost set
`DATABASE_AUTO_MIGRATE=false` after the initial migration. A once-per-minute Vercel Cron requires a plan that supports
that frequency. The handler uses the Node runtime; Turso is accessed over HTTPS,
so no persistent filesystem is required.

## Tests

```bash
bun test           # 11 unit: alert rules, message builder, Frankfurter client
bun run test:e2e   # 7 HTTP: health, auth, poll, device, alert, push skip, 7-day retention
```

The e2e suite uses an in-memory libSQL database and a fake provider; FCM is intentionally
unconfigured there, so pushes are logged as skipped.
