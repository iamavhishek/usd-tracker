import { loadConfig } from './config/env.js';
import { createApp } from './app.js';
import { createDatabase } from './db/database.js';
import { FcmService } from './features/notifications/fcm.service.js';
import { FrankfurterProvider } from './features/rates/frankfurter.js';
import { logger } from './shared/logger.js';

const config = loadConfig();
const database = createDatabase(config);

const fcm = new FcmService(config);
fcm.initialize();

const provider = new FrankfurterProvider(config);
const app = createApp({ config, database, provider, fcm });

const server = app.listen(config.port, '0.0.0.0', () => {
  logger.info(`API      → http://localhost:${config.port}/api/v1`);
  logger.info(
    `Cron     → GET/POST http://localhost:${config.port}/api/v1/cron/rates`,
  );
  logger.info(
    `Tracking ${config.baseCurrency}→[${config.quotes.join(', ')}] via ${provider.name} (no in-process scheduler)`,
  );

  if (!config.apiKey) {
    logger.warn(
      'API_KEY is not set — admin endpoints are unauthenticated. Set it before exposing this service.',
    );
  }
  if (!config.cronSecret) {
    logger.warn(
      'CRON_SECRET is not set — /api/v1/cron/* will return 503 until configured.',
    );
  }
});

let shuttingDown = false;

function shutdown(signal: string): void {
  if (shuttingDown) return;
  shuttingDown = true;
  logger.info(`${signal} received; shutting down`);

  server.close(() => {
    database.close();
    process.exit(0);
  });

  setTimeout(() => process.exit(1), 10_000).unref();
}

process.on('SIGINT', () => shutdown('SIGINT'));
process.on('SIGTERM', () => shutdown('SIGTERM'));
