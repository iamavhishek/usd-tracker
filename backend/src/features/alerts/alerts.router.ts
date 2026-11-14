import { Router } from 'express';
import type { AppConfig } from '../../config/env.js';
import { asyncHandler } from '../../shared/errors.js';
import { idParam, requireApiKey, validateBody } from '../../shared/http.js';
import {
  createAlertSchema,
  updateAlertSchema,
} from './alerts.schemas.js';
import type { AlertsService } from './alerts.service.js';

export interface AlertsRouterDeps {
  config: AppConfig;
  alerts: AlertsService;
}

export function alertsRouter({ config, alerts }: AlertsRouterDeps): Router {
  const router = Router();
  router.use(requireApiKey(config));

  router.post(
    '/',
    validateBody(createAlertSchema),
    asyncHandler(async (request, response) => {
      response.status(201).json(await alerts.create(request.body));
    }),
  );

  router.get(
    '/',
    asyncHandler(async (_request, response) => {
      response.json(await alerts.findAll());
    }),
  );

  router.get(
    '/:id',
    asyncHandler(async (request, response) => {
      response.json(await alerts.findOne(idParam(request)));
    }),
  );

  router.patch(
    '/:id',
    validateBody(updateAlertSchema),
    asyncHandler(async (request, response) => {
      response.json(await alerts.update(idParam(request), request.body));
    }),
  );

  router.delete(
    '/:id',
    asyncHandler(async (request, response) => {
      response.json(await alerts.remove(idParam(request)));
    }),
  );

  return router;
}
