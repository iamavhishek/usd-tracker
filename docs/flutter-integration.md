# Flutter (Android) integration contract

The Flutter client is implemented in [`../app`](../app); its README covers the
architecture, design system, build defines and FCM setup. This page is the
backend contract the app relies on.

## Base URL

`http://<host>:3000/api/v1`. The app defaults to `10.0.2.2` for Android
emulators; use your LAN IP or a deployed HTTPS URL on a physical device.
Override with `--dart-define=API_BASE_URL=…`.

All mutating calls send `X-API-Key` when the backend has `API_KEY` set.

## Device registration

```http
POST /devices
Content-Type: application/json

{"token": "<fcm-registration-token>", "platform": "android", "quote": "NPR"}
```

Idempotent (upsert by token). Unregister on logout:

```http
DELETE /devices/<url-encoded-token>
```

The app reads the FCM token with `FirebaseMessaging.instance.getToken()`.
`firebase_messaging` 17 deprecates this in favour of Firebase Installation IDs;
the backend uses `firebase-admin` multicast to registration tokens, so both
sides should migrate together.

## Rates

```http
GET /rates
{
  "base": "USD",
  "rates": [{
    "base": "USD", "quote": "NPR", "rate": 150.37,
    "rateDate": "2026-11-12", "fetchedAt": "2026-11-12T22:56:58.702Z",
    "provider": "frankfurter", "previousRate": 150.3,
    "change": 0.07, "changePercent": 0.0466, "direction": "up"
  }],
  "lastPoll": { "status": "ok", "trigger": "cron", "at": "…", "finishedAt": "…" }
}

GET /rates/NPR/history?limit=100
{"base":"USD","quote":"NPR","points":[{"rate":150.3,"rateDate":"2026-11-11","fetchedAt":"…"}]}
```

History is returned **oldest → newest** and contains one row per observed
change (not one per minute). The app requests 60 points and caches them in Hive.

## Alerts

```http
GET /alerts
POST /alerts            {"quote":"NPR","condition":"above","threshold":151.5,"name":"optional"}
PATCH /alerts/:id       {"enabled": false}
DELETE /alerts/:id
```

Alert rules are edge-triggered with a cooldown; `enabled` toggles notifications
without deleting the rule.

## Push test

```http
POST /notifications/test
{"quote": "NPR"}
→ {"requested":1,"deviceCount":1,"successCount":1,"failureCount":0,"skipped":false}
```

Skipped reasons the app renders: `no-devices`, `firebase-not-configured`.

## Push payload

Notification title/body plus `data` (all values strings):

| Key | Meaning |
| --- | --- |
| `type` | `rate-alert`, `rate-change`, `rate-tick`, `test` |
| `base`, `quote` | Currency pair |
| `rate`, `rateDate` | New value and publication date |
| `previousRate`, `changePercent` | For `rate-change` |
| `condition`, `threshold`, `alertId` | For `rate-alert` |
| `route` | Suggested app route, e.g. `/rates/NPR` |

Android uses the notification channel `usd_rates`; keep
`FCM_ANDROID_CHANNEL_ID` in sync if you rename it.

## Enabling push

1. Backend: set `FIREBASE_SERVICE_ACCOUNT_PATH` (or inline/base64) and restart.
2. App: `flutterfire configure` in `app/` to add
   `android/app/google-services.json`.
3. Run the app → **Settings → Enable notifications** → **Send test**.

Until step 1/2 are complete, the backend records skipped pushes in
`notifications` and the app shows push as unavailable; rates and alerts keep
working normally.
