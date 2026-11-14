import { and, desc, eq } from 'drizzle-orm';
import type { LibSQLDatabase } from 'drizzle-orm/libsql';
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
  constructor(private readonly db: LibSQLDatabase<typeof schema>) {}

  async list(): Promise<AlertRule[]> {
    return this.db.select().from(alertRules).orderBy(desc(alertRules.id));
  }

  async findById(id: number): Promise<AlertRule | undefined> {
    const rows = await this.db
      .select()
      .from(alertRules)
      .where(eq(alertRules.id, id))
      .limit(1);
    return rows[0];
  }

  async enabledForQuote(quote: string): Promise<AlertRule[]> {
    return this.db
      .select()
      .from(alertRules)
      .where(and(eq(alertRules.quote, quote), eq(alertRules.enabled, true)))
      .orderBy(desc(alertRules.id));
  }

  async create(values: CreateAlertValues): Promise<AlertRule> {
    const rows = await this.db
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
      .returning();

    const rule = rows[0];
    if (!rule) throw new Error('Failed to create alert');
    return rule;
  }

  async update(
    id: number,
    patch: UpdateAlertPatch,
  ): Promise<AlertRule | undefined> {
    const rows = await this.db
      .update(alertRules)
      .set(patch)
      .where(eq(alertRules.id, id))
      .returning();
    return rows[0];
  }

  async remove(id: number): Promise<boolean> {
    const rows = await this.db
      .delete(alertRules)
      .where(eq(alertRules.id, id))
      .returning({ id: alertRules.id });
    return rows.length > 0;
  }

  async markTriggered(id: number, at: string): Promise<void> {
    await this.db
      .update(alertRules)
      .set({ lastTriggeredAt: at, updatedAt: at })
      .where(eq(alertRules.id, id));
  }
}
