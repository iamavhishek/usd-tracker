import type { AppConfig } from '../../config/env.js';
import { logger } from '../../shared/logger.js';
import { NotificationsRepository } from '../notifications/notifications.repository.js';
import { RatesRepository } from '../rates/rates.repository.js';

export class MaintenanceService {
  constructor(
    private readonly config: AppConfig,
    private readonly rates: RatesRepository,
    private readonly notifications: NotificationsRepository,
  ) {}

  cleanup(now = Date.now()): {
    snapshotsDeleted: number;
    notificationsDeleted: number;
  } {
    const rateCutoff = new Date(
      now - this.config.historyRetentionDays * 86_400_000,
    ).toISOString();
    const notificationCutoff = new Date(
      now - this.config.notificationRetentionDays * 86_400_000,
    ).toISOString();

    const snapshotsDeleted = this.rates.deleteOlderThan(rateCutoff);
    const notificationsDeleted =
      this.notifications.deleteOlderThan(notificationCutoff);

    if (snapshotsDeleted > 0 || notificationsDeleted > 0) {
      logger.info(
        `Retention cleanup removed ${snapshotsDeleted} rate snapshot(s) and ${notificationsDeleted} notification log(s)`,
      );
    }

    return { snapshotsDeleted, notificationsDeleted };
  }
}
