import type { AppConfig } from '../../config/env.js';
import type { AlertRule } from '../../db/schema.js';
import { HttpError } from '../../shared/errors.js';
import { logger } from '../../shared/logger.js';
import type { AlertCondition } from './alert-evaluator.js';
import { AlertsRepository, type UpdateAlertPatch } from './alerts.repository.js';
import type {
  CreateAlertInput,
  UpdateAlertInput,
} from './alerts.schemas.js';

export class AlertsService {
  constructor(
    private readonly repository: AlertsRepository,
    private readonly config: AppConfig,
  ) {}

  async create(input: CreateAlertInput): Promise<AlertRule> {
    const quote = this.assertTracked(input.quote);
    const now = new Date().toISOString();

    const rule = await this.repository.create({
      name:
        input.name?.trim() ||
        this.defaultName(quote, input.condition, input.threshold),
      base: this.config.baseCurrency,
      quote,
      condition: input.condition,
      threshold: input.threshold,
      enabled: input.enabled ?? true,
      cooldownSeconds: input.cooldownSeconds ?? this.config.alertCooldownSeconds,
      now,
    });

    logger.info(
      `Created alert #${rule.id}: ${rule.base}/${rule.quote} ${rule.condition} ${rule.threshold}`,
    );

    return rule;
  }

  async findAll(): Promise<AlertRule[]> {
    return this.repository.list();
  }

  async findOne(id: number): Promise<AlertRule> {
    const rule = await this.repository.findById(id);
    if (!rule) throw new HttpError(404, `Alert #${id} not found`);
    return rule;
  }

  async update(id: number, input: UpdateAlertInput): Promise<AlertRule> {
    const existing = await this.findOne(id);
    const now = new Date().toISOString();
    const patch: UpdateAlertPatch = { updatedAt: now };

    if (input.name !== undefined) patch.name = input.name.trim() || null;
    if (input.quote !== undefined) patch.quote = this.assertTracked(input.quote);
    if (input.condition !== undefined) patch.condition = input.condition;
    if (input.threshold !== undefined) patch.threshold = input.threshold;
    if (input.enabled !== undefined) patch.enabled = input.enabled;
    if (input.cooldownSeconds !== undefined) {
      patch.cooldownSeconds = input.cooldownSeconds;
    }

    const triggerChanged =
      (input.condition !== undefined && input.condition !== existing.condition) ||
      (input.threshold !== undefined && input.threshold !== existing.threshold);

    if (triggerChanged) patch.lastTriggeredAt = null;

    const updated = await this.repository.update(id, patch);
    if (!updated) throw new HttpError(404, `Alert #${id} not found`);
    return updated;
  }

  async remove(id: number): Promise<{ id: number; removed: true }> {
    await this.findOne(id);
    await this.repository.remove(id);
    return { id, removed: true };
  }

  async enabledForQuote(quote: string): Promise<AlertRule[]> {
    return this.repository.enabledForQuote(quote);
  }

  async markTriggered(id: number, at: string): Promise<void> {
    await this.repository.markTriggered(id, at);
  }

  private assertTracked(rawQuote: string): string {
    const quote = rawQuote.trim().toUpperCase();
    if (!this.config.quotes.includes(quote)) {
      throw new HttpError(
        400,
        `Currency ${quote} is not tracked. Configured quotes: ${this.config.quotes.join(', ')}`,
      );
    }
    return quote;
  }

  private defaultName(
    quote: string,
    condition: AlertCondition,
    threshold: number,
  ): string {
    return `${this.config.baseCurrency}/${quote} ${condition} ${threshold}`;
  }
}
