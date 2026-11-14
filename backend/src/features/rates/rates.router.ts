import { Router } from 'express';
import { z } from 'zod';
import type { AppConfig } from '../../config/env.js';
import { HttpError, asyncHandler } from '../../shared/errors.js';
import {
  queryOf,
  quoteParam,
  requireApiKey,
  validateQuery,
} from '../../shared/http.js';
import type { PollingService } from './polling.service.js';
import type { RatesService } from './rates.service.js';

const historyQuery = z.object({
  limit: z.coerce.number().int().min(1).max(1000).default(100),
});

const backfillQuery = z.object({
  days: z.coerce.number().int().min(1).max(365).default(7),
});

export interface RatesRouterDeps {
  config: AppConfig;
  rates: RatesService;
  polling: PollingService;
}

export function ratesRouter({
  config,
  rates,
  polling,
}: RatesRouterDeps): Router {
  const router = Router();
  const adminOnly = requireApiKey(config);

  router.get(
    '/',
    asyncHandler(async (_request, response) => {
      response.json(await rates.getOverview());
    }),
  );

  router.get(
    '/:quote',
    asyncHandler(async (request, response) => {
      response.json(await rates.getLatest(quoteParam(request)));
    }),
  );

  router.get(
    '/:quote/history',
    validateQuery(historyQuery),
    asyncHandler(async (request, response) => {
      const { limit } = queryOf<z.infer<typeof historyQuery>>(response);
      response.json(await rates.getHistory(quoteParam(request), limit));
    }),
  );

  router.post(
    '/refresh',
    adminOnly,
    asyncHandler(async (_request, response) => {
      const summary = await polling.poll('manual');
      if (summary.status === 'error') {
        throw new HttpError(502, summary.error ?? 'Rate refresh failed');
      }
      response.json(summary);
    }),
  );

  router.post(
    '/:quote/backfill',
    adminOnly,
    validateQuery(backfillQuery),
    asyncHandler(async (request, response) => {
      const { days } = queryOf<z.infer<typeof backfillQuery>>(response);
      response.json(await rates.backfill(quoteParam(request), days));
    }),
  );

  return router;
}
