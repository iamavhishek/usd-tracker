import { and, desc, eq } from 'drizzle-orm';
import type { BunSQLiteDatabase } from 'drizzle-orm/bun-sqlite';
import { alertRules, type AlertRule } from '../../db/schema.js';
import type * as schema from '../../db/schema.js';

export interface CreateAlertValues {
  name: string | null;
  base: string;
  quote: string;
  condition: 'above' | 'below';
  threshold: number;
  enabled: boolean;
  cooldownSeconds: number;
  now: string;
}

export type UpdateAlertPatch = Partial<
  Pick<
    AlertRule,
    | 'name'
    | 'quote'
    | 'condition'
    | 'threshold'
    | 'enabled'
    | 'cooldownSeconds'
    | 'lastTriggeredAt'
    | 'updatedAt'
  >
>;

export class AlertsRepository {
  constructor(private readonly db: BunSQLiteDatabase<typeof schema>) {}

  list(): AlertRule[] {
    return this.db
      .select()
      .from(alertRules)
      .orderBy(desc(alertRules.id))
      .all();
  }

  findById(id: number): AlertRule | undefined {
    return this.db
      .select()
      .from(alertRules)
      .where(eq(alertRules.id, id))
      .get();
  }

  enabledForQuote(quote: string): AlertRule[] {
    return this.db
      .select()
      .from(alertRules)
      .where(and(eq(alertRules.quote, quote), eq(alertRules.enabled, true)))
      .orderBy(desc(alertRules.id))
      .all();
  }

  create(values: CreateAlertValues): AlertRule {
    return this.db
      .insert(alertRules)
      .values({
        name: values.name,
        base: values.base,
        quote: values.quote,
        condition: values.condition,
        threshold: values.threshold,
        enabled: values.enabled,
        cooldownSeconds: values.cooldownSeconds,
        lastTriggeredAt: null,
        createdAt: values.now,
        updatedAt: values.now,
      })
      .returning()
      .get();
  }

  update(id: number, patch: UpdateAlertPatch): AlertRule | undefined {
    return this.db
      .update(alertRules)
      .set(patch)
      .where(eq(alertRules.id, id))
      .returning()
      .get();
  }

  remove(id: number): boolean {
    return (
      this.db
        .delete(alertRules)
        .where(eq(alertRules.id, id))
        .returning({ id: alertRules.id })
        .all().length > 0
    );
  }

  markTriggered(id: number, at: string): void {
    this.db
      .update(alertRules)
      .set({ lastTriggeredAt: at, updatedAt: at })
      .where(eq(alertRules.id, id))
      .run();
  }
}
