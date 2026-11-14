import { Database } from 'bun:sqlite';
import { drizzle, type BunSQLiteDatabase } from 'drizzle-orm/bun-sqlite';
import { migrate } from 'drizzle-orm/bun-sqlite/migrator';
import { existsSync, mkdirSync } from 'node:fs';
import { dirname } from 'node:path';
import type { AppConfig } from '../config/env.js';
import { logger } from '../shared/logger.js';
import * as schema from './schema.js';

export interface DatabaseConnection {
  sqlite: Database;
  db: BunSQLiteDatabase<typeof schema>;
  ping(): boolean;
  close(): void;
}

export function createDatabase(config: AppConfig): DatabaseConnection {
  if (config.databasePath !== ':memory:') {
    mkdirSync(dirname(config.databasePath), { recursive: true });
  }

  const sqlite = new Database(config.databasePath, { create: true });
  sqlite.exec('PRAGMA journal_mode = WAL;');
  sqlite.exec('PRAGMA busy_timeout = 5000;');
  sqlite.exec('PRAGMA foreign_keys = ON;');

  const db = drizzle(sqlite, { schema });

  if (config.databaseAutoMigrate) {
    if (!existsSync(config.migrationsDir)) {
      throw new Error(
        `Drizzle migrations folder not found at "${config.migrationsDir}". ` +
          'Run "bun run db:generate" and deploy the drizzle/ directory.',
      );
    }
    migrate(db, { migrationsFolder: config.migrationsDir });
  } else {
    logger.warn('Automatic migrations are disabled');
  }

  return {
    sqlite,
    db,
    ping(): boolean {
      try {
        sqlite.query('select 1 as ok').get();
        return true;
      } catch (error) {
        logger.error('Database ping failed', error);
        return false;
      }
    },
    close(): void {
      sqlite.close();
    },
  };
}
