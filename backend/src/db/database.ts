import { createClient, type Client } from '@libsql/client';
import { drizzle, type LibSQLDatabase } from 'drizzle-orm/libsql';
import { migrate } from 'drizzle-orm/libsql/migrator';
import { existsSync, mkdirSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import type { AppConfig } from '../config/env.js';
import { logger } from '../shared/logger.js';
import * as schema from './schema.js';

export interface DatabaseConnection {
  client: Client;
  db: LibSQLDatabase<typeof schema>;
  ping(): Promise<boolean>;
  close(): void;
}

function ensureLocalDirectory(url: string): void {
  if (!url.startsWith('file:')) return;
  const path = url.slice('file:'.length);
  if (!path || path === ':memory:' || path.startsWith(':memory:')) return;
  mkdirSync(dirname(resolve(process.cwd(), path)), { recursive: true });
}

export async function createDatabase(
  config: AppConfig,
): Promise<DatabaseConnection> {
  ensureLocalDirectory(config.databaseUrl);

  const client = createClient({
    url: config.databaseUrl,
    ...(config.tursoAuthToken ? { authToken: config.tursoAuthToken } : {}),
  });
  const db = drizzle(client, { schema });

  if (config.databaseAutoMigrate) {
    if (!existsSync(config.migrationsDir)) {
      throw new Error(
        `Drizzle migrations folder not found at "${config.migrationsDir}". ` +
          'Run "bun run db:generate" and deploy the drizzle/ directory.',
      );
    }
    await migrate(db, { migrationsFolder: config.migrationsDir });
  } else {
    logger.warn('Automatic migrations are disabled');
  }

  return {
    client,
    db,
    async ping(): Promise<boolean> {
      try {
        await client.execute('select 1 as ok');
        return true;
      } catch (error) {
        logger.error('Database ping failed', error);
        return false;
      }
    },
    close(): void {
      client.close();
    },
  };
}
