import type { AppConfig } from '../../config/env.js';
import { AppStateRepository } from '../../db/app-state.js';
import { logger } from '../../shared/logger.js';
import { shouldTriggerAlert } from '../alerts/alert-evaluator.js';
import { AlertsService } from '../alerts/alerts.service.js';
import { MaintenanceService } from '../maintenance/maintenance.service.js';
import { NotificationsService } from '../notifications/notifications.service.js';
import type { NotificationOutcome } from '../notifications/notification.types.js';
import type {
  PollNotificationTally,
  PollSummary,
  PollTrigger,
} from './poll-summary.js';
import type { RateProvider } from './rate-provider.js';
import { RatesService, type IngestedRate } from './rates.service.js';

const LAST_POLL_KEY = 'last_poll';

/**
 * One poll = fetch, store, evaluate alerts, send pushes. The external cron
 * service calls this through /api/v1/cron/rates. Overlapping calls are skipped.
 */
export class PollingService {
  private inFlight = false;

  constructor(
    private readonly provider: RateProvider,
    private readonly config: AppConfig,
    private readonly rates: RatesService,
    private readonly alerts: AlertsService,
    private readonly notifications: NotificationsService,
    private readonly state: AppStateRepository,
    private readonly maintenance: MaintenanceService,
  ) {}

  async poll(trigger: PollTrigger): Promise<PollSummary> {
    const startedAt = new Date();

    if (this.inFlight) {
      logger.warn('Previous poll is still running; skipping this tick');
      return {
        status: 'skipped',
        trigger,
        at: startedAt.toISOString(),
        finishedAt: startedAt.toISOString(),
        durationMs: 0,
        rates: [],
        notifications: { sent: 0, failed: 0, skipped: 0 },
        error: 'previous poll still running',
      };
    }

    this.inFlight = true;
    this.pruneOldData();

    try {
      const fetched = await this.provider.fetchRates(
        this.config.baseCurrency,
        this.config.quotes,
      );
      const ingested = this.rates.ingest(fetched);
      const notifications = await this.dispatch(ingested);
      const finishedAt = new Date();

      const summary: PollSummary = {
        status: 'ok',
        trigger,
        at: startedAt.toISOString(),
        finishedAt: finishedAt.toISOString(),
        durationMs: finishedAt.getTime() - startedAt.getTime(),
        rates: ingested.map((item) => ({
          quote: item.quote,
          rate: item.rate,
          rateDate: item.rateDate,
          previousRate: item.previousRate,
          changed: item.changed,
        })),
        notifications,
      };

      this.state.set(LAST_POLL_KEY, summary);
      logger.info(
        `Poll ${trigger} ok in ${summary.durationMs}ms — ` +
          `${ingested.filter((rate) => rate.changed).length}/${ingested.length} changed, ` +
          `pushes ${notifications.sent} sent / ${notifications.failed} failed / ${notifications.skipped} skipped`,
      );

      return summary;
    } catch (error) {
      const finishedAt = new Date();
      const message = error instanceof Error ? error.message : String(error);

      const summary: PollSummary = {
        status: 'error',
        trigger,
        at: startedAt.toISOString(),
        finishedAt: finishedAt.toISOString(),
        durationMs: finishedAt.getTime() - startedAt.getTime(),
        rates: [],
        notifications: { sent: 0, failed: 0, skipped: 0 },
        error: message,
      };

      this.state.set(LAST_POLL_KEY, summary);
      logger.error(`Poll ${trigger} failed: ${message}`);
      return summary;
    } finally {
      this.inFlight = false;
    }
  }

  private pruneOldData(): void {
    try {
      this.maintenance.cleanup();
    } catch (error) {
      logger.warn(
        `Retention cleanup failed: ${error instanceof Error ? error.message : String(error)}`,
      );
    }
  }

  private async dispatch(
    ingested: IngestedRate[],
  ): Promise<PollNotificationTally> {
    const tally: PollNotificationTally = { sent: 0, failed: 0, skipped: 0 };
    const nowIso = new Date().toISOString();

    for (const item of ingested) {
      if (item.previousRate !== null) {
        for (const rule of this.alerts.enabledForQuote(item.quote)) {
          const triggered = shouldTriggerAlert({
            condition: rule.condition,
            threshold: rule.threshold,
            previousRate: item.previousRate,
            currentRate: item.rate,
            lastTriggeredAt: rule.lastTriggeredAt,
            cooldownSeconds: rule.cooldownSeconds,
          });

          if (!triggered) continue;

          const outcome = await this.notifications.notifyRateAlert({
            base: item.base,
            quote: item.quote,
            rate: item.rate,
            rateDate: item.rateDate,
            condition: rule.condition,
            threshold: rule.threshold,
            ruleName: rule.name,
          });
          this.alerts.markTriggered(rule.id, nowIso);
          this.tally(outcome, tally);
        }

        if (this.config.significantChangePercent > 0) {
          const changePercent =
            ((item.rate - item.previousRate) / item.previousRate) * 100;

          if (Math.abs(changePercent) >= this.config.significantChangePercent) {
            const outcome = await this.notifications.notifyRateChange({
              base: item.base,
              quote: item.quote,
              rate: item.rate,
              rateDate: item.rateDate,
              previousRate: item.previousRate,
              changePercent,
            });
            this.tally(outcome, tally);
          }
        }
      }

      if (this.config.notifyEveryTick) {
        const outcome = await this.notifications.notifyTick({
          base: item.base,
          quote: item.quote,
          rate: item.rate,
          rateDate: item.rateDate,
        });
        this.tally(outcome, tally);
      }
    }

    return tally;
  }

  private tally(
    outcome: NotificationOutcome,
    tally: PollNotificationTally,
  ): void {
    if (outcome.skipped) {
      tally.skipped += 1;
    } else if (outcome.successCount > 0) {
      tally.sent += 1;
    } else {
      tally.failed += 1;
    }
  }
}
