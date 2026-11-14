import { Router } from 'express';
import type { HealthService } from './health.service.js';
import { asyncHandler } from '../../shared/errors.js';

export function healthRouter(health: HealthService): Router {
  const router = Router();
  router.get(
    '/',
    asyncHandler(async (_request, response) => {
      response.json(await health.check());
    }),
  );
  return router;
}
