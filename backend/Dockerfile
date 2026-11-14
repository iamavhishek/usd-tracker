# syntax=docker/dockerfile:1

# ─── Install all dependencies (including drizzle-kit for the build) ─────────
FROM oven/bun:1 AS deps
WORKDIR /app
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# ─── Compile TypeScript ─────────────────────────────────────────────────────
FROM deps AS build
WORKDIR /app
COPY . .
RUN bun run build

# ─── Runtime ────────────────────────────────────────────────────────────────
FROM oven/bun:1 AS runtime
WORKDIR /app

ENV NODE_ENV=production \
    PORT=3000 \
    DATABASE_PATH=/app/data/usd-tracker.db \
    MIGRATIONS_DIR=/app/drizzle

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production

COPY --from=build /app/dist ./dist
COPY --from=build /app/drizzle ./drizzle

RUN mkdir -p /app/data && chown -R bun:bun /app

USER bun
EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
  CMD bun -e "fetch('http://127.0.0.1:3000/api/v1/health').then((r) => process.exit(r.ok ? 0 : 1)).catch(() => process.exit(1))"

CMD ["bun", "dist/server.js"]
