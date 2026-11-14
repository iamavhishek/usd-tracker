import { and, count, desc, eq, inArray } from 'drizzle-orm';
import type { BunSQLiteDatabase } from 'drizzle-orm/bun-sqlite';
import { devices, type Device } from '../../db/schema.js';
import type * as schema from '../../db/schema.js';

export interface UpsertDeviceInput {
  token: string;
  platform: 'android' | 'ios' | 'web' | 'unknown';
  quote: string;
  now: string;
}

const DELETE_CHUNK_SIZE = 400;

export class DevicesRepository {
  constructor(private readonly db: BunSQLiteDatabase<typeof schema>) {}

  upsert(input: UpsertDeviceInput): Device {
    const device = this.db
      .insert(devices)
      .values({
        token: input.token,
        platform: input.platform,
        quote: input.quote,
        enabled: true,
        createdAt: input.now,
        updatedAt: input.now,
        lastSeenAt: input.now,
      })
      .onConflictDoUpdate({
        target: devices.token,
        set: {
          platform: input.platform,
          quote: input.quote,
          enabled: true,
          updatedAt: input.now,
          lastSeenAt: input.now,
        },
      })
      .returning()
      .get();

    if (!device) throw new Error('Failed to persist device registration');
    return device;
  }

  list(): Device[] {
    return this.db
      .select()
      .from(devices)
      .orderBy(desc(devices.createdAt))
      .all();
  }

  activeTokensForQuote(quote: string): string[] {
    return this.db
      .select({ token: devices.token })
      .from(devices)
      .where(and(eq(devices.quote, quote), eq(devices.enabled, true)))
      .all()
      .map((row) => row.token);
  }

  countActive(): number {
    const row = this.db
      .select({ value: count() })
      .from(devices)
      .where(eq(devices.enabled, true))
      .get();
    return Number(row?.value ?? 0);
  }

  remove(token: string): boolean {
    return (
      this.db
        .delete(devices)
        .where(eq(devices.token, token))
        .returning({ id: devices.id })
        .all().length > 0
    );
  }

  removeMany(tokens: string[]): number {
    const unique = [...new Set(tokens)].filter(Boolean);
    if (unique.length === 0) return 0;

    let removed = 0;
    this.db.transaction((tx) => {
      for (let index = 0; index < unique.length; index += DELETE_CHUNK_SIZE) {
        const chunk = unique.slice(index, index + DELETE_CHUNK_SIZE);
        removed += tx
          .delete(devices)
          .where(inArray(devices.token, chunk))
          .returning({ id: devices.id })
          .all().length;
      }
    });
    return removed;
  }
}
