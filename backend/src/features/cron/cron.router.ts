import { Router, type Request, type Response } from 'express';
import type { AppConfig } from '../../config/env.js';
import { HttpError, asyncHandler } from '../../shared/errors.js';
import { requireCronSecret } from '../../shared/http.js';
import type { MaintenanceService } from '../maintenance/maintenance.service.js';
import type { PollingService } from '../rates/polling.service.js';

export interface CronRouterDeps {
  config: AppConfig;
  polling: PollingService;
  maintenance: MaintenanceService;
}

/**
 * External scheduler entry points. Any cron service can call these; both GET
 * and POST are accepted so Vercel Cron and shell cron work without adapters.
 */
export function cronRouter({
  config,
  polling,
  maintenance,
}: CronRouterDeps): Router {
  const router = Router();
  router.use(requireCronSecret(config));

  const runPoll = asyncHandler(async (_request, response) => {
    const summary = await polling.poll('cron');
    if (summary.status === 'error') {
      throw new HttpError(502, summary.error ?? 'Rate poll failed');
    }
    response.status(200).json(summary);
  });

  const runCleanup = asyncHandler(async (_request, response) => {
    response.status(200).json(await maintenance.cleanup());
  });

  router.get('/rates', runPoll);
  router.post('/rates', runPoll);
  router.get('/maintenance', runCleanup);
  router.post('/maintenance', runCleanup);

  return router;
}
