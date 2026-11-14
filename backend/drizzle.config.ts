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
  dialect: 'sqlite',
  dbCredentials: {
    url: process.env.DATABASE_PATH ?? './data/usd-tracker.db',
  },
  strict: true,
  verbose: true,
});
