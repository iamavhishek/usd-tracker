import { Router } from 'express';
import type { AppConfig } from '../../config/env.js';
import { HttpError } from '../../shared/errors.js';
import { requireApiKey, validateBody } from '../../shared/http.js';
import { registerDeviceSchema } from './devices.schemas.js';
import type { DevicesService } from './devices.service.js';

export interface DevicesRouterDeps {
  config: AppConfig;
  devices: DevicesService;
}

export function devicesRouter({ config, devices }: DevicesRouterDeps): Router {
  const router = Router();
  router.use(requireApiKey(config));

  router.post(
    '/',
    validateBody(registerDeviceSchema),
    (request, response) => {
      response.status(201).json(devices.register(request.body));
    },
  );

  router.get('/', (_request, response) => {
    response.json(devices.list());
  });

  router.delete('/:token', (request, response) => {
    const token =
      typeof request.params.token === 'string' ? request.params.token : '';
    if (!token) throw new HttpError(400, 'token is required');
    response.json(devices.remove(token));
  });

  return router;
}
