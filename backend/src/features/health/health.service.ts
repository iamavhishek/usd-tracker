import type { AppConfig } from '../../config/env.js';
import { AppStateRepository } from '../../db/app-state.js';
import type { DatabaseConnection } from '../../db/database.js';
import type { PollSummary } from '../rates/poll-summary.js';
import type { RateProvider } from '../rates/rate-provider.js';
import { DevicesService } from '../devices/devices.service.js';
import { FcmService } from '../notifications/fcm.service.js';

const STALE_AFTER_MS = 5 * 60_000;

export class HealthService {
  constructor(
    private readonly config: AppConfig,
    private readonly database: DatabaseConnection,
    private readonly state: AppStateRepository,
    private readonly devices: DevicesService,
    private readonly fcm: FcmService,
    private readonly provider: RateProvider,
  ) {}

  async check(): Promise<Record<string, unknown>> {
    const lastPoll = await this.state.get<PollSummary>('last_poll');
    const databaseOk = await this.database.ping();
    const lastPollAgeMs = lastPoll
      ? Date.now() - Date.parse(lastPoll.finishedAt)
      : null;
    const stale = lastPollAgeMs === null || lastPollAgeMs > STALE_AFTER_MS;

    const status = !databaseOk
      ? 'down'
      : lastPoll?.status === 'error' || stale
        ? 'degraded'
        : 'ok';

    return {
      status,
      timestamp: new Date().toISOString(),
      uptimeSeconds: Math.round(process.uptime()),
      version: '1.0.0',
      database: { ok: databaseOk },
      provider: { name: this.provider.name },
      rate: {
        baseCurrency: this.config.baseCurrency,
        quotes: this.config.quotes,
        pollMode: 'external-cron',
        lastPollAgeMs,
        stale,
        lastPoll,
      },
      fcm: this.fcm.status,
      devices: { active: await this.devices.count() },
    };
  }
}
