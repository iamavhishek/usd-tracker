import type { BunSQLiteDatabase } from 'drizzle-orm/bun-sqlite';
import { and, desc, eq, lt } from 'drizzle-orm';
import {
  rateSnapshots,
  type NewRateSnapshot,
  type RateSnapshot,
} from '../../db/schema.js';
import type * as schema from '../../db/schema.js';

export class RatesRepository {
  constructor(private readonly db: BunSQLiteDatabase<typeof schema>) {}

  latest(quote: string): RateSnapshot | undefined {
    return this.db
      .select()
      .from(rateSnapshots)
      .where(eq(rateSnapshots.quote, quote))
      .orderBy(desc(rateSnapshots.fetchedAt), desc(rateSnapshots.id))
      .limit(1)
      .get();
  }

  latestBefore(
    quote: string,
    current: RateSnapshot,
  ): RateSnapshot | undefined {
    return this.db
      .select()
      .from(rateSnapshots)
      .where(
        and(
          eq(rateSnapshots.quote, quote),
          lt(rateSnapshots.fetchedAt, current.fetchedAt),
        ),
      )
      .orderBy(desc(rateSnapshots.fetchedAt), desc(rateSnapshots.id))
      .limit(1)
      .get();
  }

  insert(snapshot: NewRateSnapshot): number {
    return this.db
      .insert(rateSnapshots)
      .values(snapshot)
      .onConflictDoNothing()
      .returning({ id: rateSnapshots.id })
      .all().length;
  }

  insertMany(snapshots: NewRateSnapshot[]): number {
    if (snapshots.length === 0) return 0;

    return this.db.transaction((tx) => {
      let inserted = 0;
      for (const snapshot of snapshots) {
        inserted += tx
          .insert(rateSnapshots)
          .values(snapshot)
          .onConflictDoNothing()
          .returning({ id: rateSnapshots.id })
          .all().length;
      }
      return inserted;
    });
  }

  history(quote: string, limit: number): RateSnapshot[] {
    return this.db
      .select()
      .from(rateSnapshots)
      .where(eq(rateSnapshots.quote, quote))
      .orderBy(desc(rateSnapshots.fetchedAt), desc(rateSnapshots.id))
      .limit(limit)
      .all();
  }

  deleteOlderThan(cutoffIso: string): number {
    return this.db
      .delete(rateSnapshots)
      .where(lt(rateSnapshots.fetchedAt, cutoffIso))
      .returning({ id: rateSnapshots.id })
      .all().length;
  }
}
