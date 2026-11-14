import { Router } from 'express';
import { z } from 'zod';
import type { AppConfig } from '../../config/env.js';
import { asyncHandler } from '../../shared/errors.js';
import {
  queryOf,
  requireApiKey,
  validateBody,
  validateQuery,
} from '../../shared/http.js';
import type { NotificationsService } from './notifications.service.js';

const listQuery = z.object({
  limit: z.coerce.number().int().min(1).max(200).default(50),
});

const testSchema = z.object({
  token: z.string().trim().min(10).max(4096).optional(),
  quote: z
    .string()
    .trim()
    .transform((value) => value.toUpperCase())
    .pipe(z.string().regex(/^[A-Z]{3}$/))
    .optional(),
  title: z.string().trim().max(100).optional(),
  body: z.string().trim().max(300).optional(),
});

export interface NotificationsRouterDeps {
  config: AppConfig;
  notifications: NotificationsService;
}

export function notificationsRouter({
  config,
  notifications,
}: NotificationsRouterDeps): Router {
  const router = Router();
  router.use(requireApiKey(config));

  router.get(
    '/',
    validateQuery(listQuery),
    (_request, response) => {
      const { limit } = queryOf<z.infer<typeof listQuery>>(response);
      response.json(notifications.history(limit));
    },
  );

  router.post(
    '/test',
    validateBody(testSchema),
    asyncHandler(async (request, response) => {
      response.json(await notifications.sendTest(request.body));
    }),
  );

  return router;
}
