import { eq } from 'drizzle-orm';
import type { BunSQLiteDatabase } from 'drizzle-orm/bun-sqlite';
import { appState } from './schema.js';
import type * as schema from './schema.js';

export class AppStateRepository {
  constructor(private readonly db: BunSQLiteDatabase<typeof schema>) {}

  set<T>(key: string, value: T): void {
    const serialized = JSON.stringify(value);
    const now = new Date().toISOString();

    this.db
      .insert(appState)
      .values({ key, value: serialized, updatedAt: now })
      .onConflictDoUpdate({
        target: appState.key,
        set: { value: serialized, updatedAt: now },
      })
      .run();
  }

  get<T>(key: string): T | null {
    const row = this.db
      .select()
      .from(appState)
      .where(eq(appState.key, key))
      .get();

    if (!row) return null;

    try {
      return JSON.parse(row.value) as T;
    } catch {
      return null;
    }
  }
}
