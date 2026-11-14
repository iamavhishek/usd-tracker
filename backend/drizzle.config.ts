import { defineConfig } from 'drizzle-kit';

/**
 * drizzle-kit CLI configuration.
 *
 *   bun run db:generate   → create SQL migrations from src/database/schema.ts
 *   bun run db:migrate    → apply them manually (the API also auto-migrates)
 *   bun run db:studio     → browse the SQLite file
 */
export default defineConfig({
  schema: './src/db/schema.ts',
  out: './drizzle',
  dialect: 'turso',
  dbCredentials: {
    url: process.env.TURSO_DATABASE_URL ?? 'file:./data/usd-tracker.db',
    authToken: process.env.TURSO_AUTH_TOKEN,
  },
  strict: true,
  verbose: true,
});
