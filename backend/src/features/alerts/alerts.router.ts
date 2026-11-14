import { Router } from 'express';
import type { AppConfig } from '../../config/env.js';
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
    (request, response) => {
      response.status(201).json(alerts.create(request.body));
    },
  );

  router.get('/', (_request, response) => {
    response.json(alerts.findAll());
  });

  router.get('/:id', (request, response) => {
    response.json(alerts.findOne(idParam(request)));
  });

  router.patch(
    '/:id',
    validateBody(updateAlertSchema),
    (request, response) => {
      response.json(alerts.update(idParam(request), request.body));
    },
  );

  router.delete('/:id', (request, response) => {
    response.json(alerts.remove(idParam(request)));
  });

  return router;
}
