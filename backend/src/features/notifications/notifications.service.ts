import type { AppConfig } from '../../config/env.js';
import type { Notification } from '../../db/schema.js';
import { DevicesService } from '../devices/devices.service.js';
import type { AlertCondition } from '../alerts/alert-evaluator.js';
import { logger } from '../../shared/logger.js';
import { FcmService } from './fcm.service.js';
import {
  buildAlertMessage,
  buildRateChangeMessage,
  buildTestMessage,
  buildTickMessage,
} from './message.builder.js';
import { NotificationsRepository } from './notifications.repository.js';
import type {
  NotificationOutcome,
  NotificationType,
  PushMessage,
} from './notification.types.js';

export interface RateAlertInput {
  base: string;
  quote: string;
  rate: number;
  rateDate: string;
  condition: AlertCondition;
  threshold: number;
  ruleName: string | null;
  alertId?: number;
}

export interface RateChangeInput {
  base: string;
  quote: string;
  rate: number;
  rateDate: string;
  previousRate: number;
  changePercent: number;
}

export interface TickInput {
  base: string;
  quote: string;
  rate: number;
  rateDate: string;
}

export interface TestInput {
  token?: string;
  quote?: string;
  title?: string;
  body?: string;
}

export class NotificationsService {
  constructor(
    private readonly fcm: FcmService,
    private readonly repository: NotificationsRepository,
    private readonly devices: DevicesService,
    private readonly config: AppConfig,
  ) {}

  async notifyRateAlert(input: RateAlertInput): Promise<NotificationOutcome> {
    return this.deliver(
      'rate-alert',
      input,
      buildAlertMessage({
        base: input.base,
        quote: input.quote,
        rate: input.rate,
        rateDate: input.rateDate,
        condition: input.condition,
        threshold: input.threshold,
        ruleName: input.ruleName,
        alertId: input.alertId,
      }),
    );
  }

  async notifyRateChange(input: RateChangeInput): Promise<NotificationOutcome> {
    return this.deliver(
      'rate-change',
      input,
      buildRateChangeMessage(input),
    );
  }

  async notifyTick(input: TickInput): Promise<NotificationOutcome> {
    return this.deliver('rate-tick', input, buildTickMessage(input));
  }

  async sendTest(input: TestInput): Promise<NotificationOutcome> {
    const base = this.config.baseCurrency;
    const quote = (input.quote ?? this.config.quotes[0] ?? base).toUpperCase();
    const tokens = input.token
      ? [input.token]
      : await this.devices.activeTokensForQuote(quote);

    return this.deliver(
      'test',
      { base, quote, rate: 0 },
      buildTestMessage({
        base,
        quote,
        title: input.title,
        body: input.body,
      }),
      tokens,
    );
  }

  async history(limit: number): Promise<Notification[]> {
    return this.repository.recent(limit);
  }

  private async deliver(
    type: NotificationType,
    context: { base: string; quote: string; rate: number },
    message: PushMessage,
    explicitTokens?: string[],
  ): Promise<NotificationOutcome> {
    const tokens =
      explicitTokens ?? (await this.devices.activeTokensForQuote(context.quote));
    const deviceCount = tokens.length;

    if (deviceCount === 0) {
      await this.repository.create({
        type,
        title: message.title,
        body: message.body,
        base: context.base,
        quote: context.quote,
        rate: context.rate,
        deviceCount: 0,
        successCount: 0,
        failureCount: 0,
        skipped: true,
        skippedReason: 'no-devices',
        createdAt: new Date().toISOString(),
      });

      logger.warn(
        `No registered devices for ${context.base}/${context.quote}; skipped "${message.title}"`,
      );

      return {
        requested: 0,
        deviceCount: 0,
        successCount: 0,
        failureCount: 0,
        skipped: true,
        skippedReason: 'no-devices',
      };
    }

    const result = await this.fcm.send(tokens, message);

    if (result.invalidTokens.length > 0) {
      const pruned = await this.devices.removeTokens(result.invalidTokens);
      logger.info(`Removed ${pruned} invalid FCM token(s)`);
    }

    const outcome: NotificationOutcome = {
      requested: result.requested,
      deviceCount,
      successCount: result.successCount,
      failureCount: result.failureCount,
      skipped: result.skipped,
      ...(result.error ? { skippedReason: result.error } : {}),
    };

    await this.repository.create({
      type,
      title: message.title,
      body: message.body,
      base: context.base,
      quote: context.quote,
      rate: context.rate,
      deviceCount,
      successCount: result.successCount,
      failureCount: result.failureCount,
      skipped: result.skipped,
      skippedReason: result.error ?? null,
      createdAt: new Date().toISOString(),
    });

    if (result.skipped) {
      logger.warn(
        `Push "${message.title}" skipped (${result.error ?? 'unknown reason'}) — logged to notification history`,
      );
    } else {
      logger.info(
        `Push "${message.title}" → ${result.successCount}/${deviceCount} device(s) ok` +
          (result.failureCount > 0 ? `, ${result.failureCount} failed` : ''),
      );
    }

    return outcome;
  }
}
