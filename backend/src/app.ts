import cors from 'cors';
import express, { type Express } from 'express';
import type { AppConfig } from './config/env.js';
import type { DatabaseConnection } from './db/database.js';
import { AppStateRepository } from './db/app-state.js';
import { AlertsRepository } from './features/alerts/alerts.repository.js';
import { AlertsService } from './features/alerts/alerts.service.js';
import { alertsRouter } from './features/alerts/alerts.router.js';
import { cronRouter } from './features/cron/cron.router.js';
import { DevicesRepository } from './features/devices/devices.repository.js';
import { DevicesService } from './features/devices/devices.service.js';
import { devicesRouter } from './features/devices/devices.router.js';
import { HealthService } from './features/health/health.service.js';
import { healthRouter } from './features/health/health.router.js';
import { MaintenanceService } from './features/maintenance/maintenance.service.js';
import { FcmService } from './features/notifications/fcm.service.js';
import { NotificationsRepository } from './features/notifications/notifications.repository.js';
import { NotificationsService } from './features/notifications/notifications.service.js';
import { notificationsRouter } from './features/notifications/notifications.router.js';
import { PollingService } from './features/rates/polling.service.js';
import type { RateProvider } from './features/rates/rate-provider.js';
import { RatesRepository } from './features/rates/rates.repository.js';
import { ratesRouter } from './features/rates/rates.router.js';
import { RatesService } from './features/rates/rates.service.js';
import { errorHandler, notFoundHandler } from './shared/errors.js';

export interface AppDependencies {
  config: AppConfig;
  database: DatabaseConnection;
  provider: RateProvider;
  fcm: FcmService;
}

export function createApp({
  config,
  database,
  provider,
  fcm,
}: AppDependencies): Express {
  const state = new AppStateRepository(database.db);

  const ratesRepository = new RatesRepository(database.db);
  const ratesService = new RatesService(
    provider,
    ratesRepository,
    config,
    state,
  );

  const alertsRepository = new AlertsRepository(database.db);
  const alertsService = new AlertsService(alertsRepository, config);

  const devicesRepository = new DevicesRepository(database.db);
  const devicesService = new DevicesService(devicesRepository, config);

  const notificationsRepository = new NotificationsRepository(database.db);
  const notificationsService = new NotificationsService(
    fcm,
    notificationsRepository,
    devicesService,
    config,
  );

  const maintenance = new MaintenanceService(
    config,
    ratesRepository,
    notificationsRepository,
  );
  // Enforce retention on boot as well as on every poll.
  maintenance.cleanup();

  const polling = new PollingService(
    provider,
    config,
    ratesService,
    alertsService,
    notificationsService,
    state,
    maintenance,
  );

  const health = new HealthService(
    config,
    database,
    state,
    devicesService,
    fcm,
    provider,
  );

  const app = express();
  app.disable('x-powered-by');
  app.use(cors({ origin: config.corsOrigins }));
  app.use(express.json({ limit: '128kb' }));

  app.use('/api/v1/health', healthRouter(health));
  app.use(
    '/api/v1/rates',
    ratesRouter({ config, rates: ratesService, polling }),
  );
  app.use('/api/v1/alerts', alertsRouter({ config, alerts: alertsService }));
  app.use(
    '/api/v1/devices',
    devicesRouter({ config, devices: devicesService }),
  );
  app.use(
    '/api/v1/notifications',
    notificationsRouter({ config, notifications: notificationsService }),
  );
  app.use(
    '/api/v1/cron',
    cronRouter({ config, polling, maintenance }),
  );

  app.use(notFoundHandler);
  app.use(errorHandler);

  return app;
}
