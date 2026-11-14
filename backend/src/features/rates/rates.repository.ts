import { and, desc, eq, lt } from 'drizzle-orm';
import type { LibSQLDatabase } from 'drizzle-orm/libsql';
import {
  rateSnapshots,
  type NewRateSnapshot,
  type RateSnapshot,
} from '../../db/schema.js';
import type * as schema from '../../db/schema.js';

export class RatesRepository {
  constructor(private readonly db: LibSQLDatabase<typeof schema>) {}

  async latest(quote: string): Promise<RateSnapshot | undefined> {
    const rows = await this.db
      .select()
      .from(rateSnapshots)
      .where(eq(rateSnapshots.quote, quote))
      .orderBy(desc(rateSnapshots.fetchedAt), desc(rateSnapshots.id))
      .limit(1);
    return rows[0];
  }

  async latestBefore(
    quote: string,
    current: RateSnapshot,
  ): Promise<RateSnapshot | undefined> {
    const rows = await this.db
      .select()
      .from(rateSnapshots)
      .where(
        and(
          eq(rateSnapshots.quote, quote),
          lt(rateSnapshots.fetchedAt, current.fetchedAt),
        ),
      )
      .orderBy(desc(rateSnapshots.fetchedAt), desc(rateSnapshots.id))
      .limit(1);
    return rows[0];
  }

  async insert(snapshot: NewRateSnapshot): Promise<number> {
    const rows = await this.db
      .insert(rateSnapshots)
      .values(snapshot)
      .onConflictDoNothing()
      .returning({ id: rateSnapshots.id });
    return rows.length;
  }

  async insertMany(snapshots: NewRateSnapshot[]): Promise<number> {
    if (snapshots.length === 0) return 0;

    return this.db.transaction(async (tx) => {
      let inserted = 0;
      for (const snapshot of snapshots) {
        const rows = await tx
          .insert(rateSnapshots)
          .values(snapshot)
          .onConflictDoNothing()
          .returning({ id: rateSnapshots.id });
        inserted += rows.length;
      }
      return inserted;
    });
  }

  async history(quote: string, limit: number): Promise<RateSnapshot[]> {
    return this.db
      .select()
      .from(rateSnapshots)
      .where(eq(rateSnapshots.quote, quote))
      .orderBy(desc(rateSnapshots.fetchedAt), desc(rateSnapshots.id))
      .limit(limit);
  }

  async deleteOlderThan(cutoffIso: string): Promise<number> {
    const rows = await this.db
      .delete(rateSnapshots)
      .where(lt(rateSnapshots.fetchedAt, cutoffIso))
      .returning({ id: rateSnapshots.id });
    return rows.length;
  }
}
