import { and, count, desc, eq, inArray } from 'drizzle-orm';
import type { LibSQLDatabase } from 'drizzle-orm/libsql';
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
  constructor(private readonly db: LibSQLDatabase<typeof schema>) {}

  async upsert(input: UpsertDeviceInput): Promise<Device> {
    const rows = await this.db
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
      .returning();

    const device = rows[0];
    if (!device) throw new Error('Failed to persist device registration');
    return device;
  }

  async list(): Promise<Device[]> {
    return this.db.select().from(devices).orderBy(desc(devices.createdAt));
  }

  async activeTokensForQuote(quote: string): Promise<string[]> {
    const rows = await this.db
      .select({ token: devices.token })
      .from(devices)
      .where(and(eq(devices.quote, quote), eq(devices.enabled, true)));
    return rows.map((row) => row.token);
  }

  async countActive(): Promise<number> {
    const rows = await this.db
      .select({ value: count() })
      .from(devices)
      .where(eq(devices.enabled, true))
      .limit(1);
    return Number(rows[0]?.value ?? 0);
  }

  async remove(token: string): Promise<boolean> {
    const rows = await this.db
      .delete(devices)
      .where(eq(devices.token, token))
      .returning({ id: devices.id });
    return rows.length > 0;
  }

  async removeMany(tokens: string[]): Promise<number> {
    const unique = [...new Set(tokens)].filter(Boolean);
    if (unique.length === 0) return 0;

    let removed = 0;
    await this.db.transaction(async (tx) => {
      for (let index = 0; index < unique.length; index += DELETE_CHUNK_SIZE) {
        const chunk = unique.slice(index, index + DELETE_CHUNK_SIZE);
        const rows = await tx
          .delete(devices)
          .where(inArray(devices.token, chunk))
          .returning({ id: devices.id });
        removed += rows.length;
      }
    });
    return removed;
  }
}
