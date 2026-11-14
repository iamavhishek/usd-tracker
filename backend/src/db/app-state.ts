import { eq } from 'drizzle-orm';
import type { LibSQLDatabase } from 'drizzle-orm/libsql';
import { appState } from './schema.js';
import type * as schema from './schema.js';

export class AppStateRepository {
  constructor(private readonly db: LibSQLDatabase<typeof schema>) {}

  async set<T>(key: string, value: T): Promise<void> {
    const serialized = JSON.stringify(value);
    const now = new Date().toISOString();

    await this.db
      .insert(appState)
      .values({ key, value: serialized, updatedAt: now })
      .onConflictDoUpdate({
        target: appState.key,
        set: { value: serialized, updatedAt: now },
      });
  }

  async get<T>(key: string): Promise<T | null> {
    const rows = await this.db
      .select()
      .from(appState)
      .where(eq(appState.key, key))
      .limit(1);
    const row = rows[0];

    if (!row) return null;

    try {
      return JSON.parse(row.value) as T;
    } catch {
      return null;
    }
  }
}
