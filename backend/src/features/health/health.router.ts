import { Router } from 'express';
import type { HealthService } from './health.service.js';

export function healthRouter(health: HealthService): Router {
  const router = Router();
  router.get('/', (_request, response) => {
    response.json(health.check());
  });
  return router;
}
