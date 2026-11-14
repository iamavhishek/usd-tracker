import type { Request, RequestHandler, Response } from 'express';
import { timingSafeEqual } from 'node:crypto';
import type { ZodType } from 'zod';
import type { AppConfig } from '../config/env.js';
import { HttpError } from './errors.js';

function safeEquals(provided: string, expected: string): boolean {
  const left = Buffer.from(provided);
  const right = Buffer.from(expected);
  if (left.length !== right.length) return false;
  return timingSafeEqual(left, right);
}

function providedSecret(request: Request, header: string): string | undefined {
  const direct = request.headers[header];
  if (typeof direct === 'string' && direct.trim().length > 0) {
    return direct.trim();
  }

  const authorization = request.headers.authorization;
  if (authorization?.toLowerCase().startsWith('bearer ')) {
    return authorization.slice(7).trim() || undefined;
  }

  return undefined;
}

/** Optional admin key. If API_KEY is empty, the route is open (dev only). */
export function requireApiKey(config: AppConfig): RequestHandler {
  return (request, _response, next) => {
    if (!config.apiKey) return next();

    const provided = providedSecret(request, 'x-api-key');
    if (!provided) {
      return next(
        new HttpError(401, 'Missing API key. Send it in the X-API-Key header.'),
      );
    }
    if (!safeEquals(provided, config.apiKey)) {
      return next(new HttpError(401, 'Invalid API key'));
    }
    return next();
  };
}

/** Separate secret for the external cron service. */
export function requireCronSecret(config: AppConfig): RequestHandler {
  return (request, _response, next) => {
    if (!config.cronSecret) {
      return next(
        new HttpError(503, 'CRON_SECRET is not configured on the server'),
      );
    }

    const provided = providedSecret(request, 'x-cron-secret');
    if (!provided) {
      return next(
        new HttpError(401, 'Missing cron secret. Send X-Cron-Secret or a Bearer token.'),
      );
    }
    if (!safeEquals(provided, config.cronSecret)) {
      return next(new HttpError(401, 'Invalid cron secret'));
    }
    return next();
  };
}

export function validateBody<T>(schema: ZodType<T>): RequestHandler {
  return (request, _response, next) => {
    const result = schema.safeParse(request.body);
    if (!result.success) return next(result.error);
    request.body = result.data;
    return next();
  };
}

/**
 * Parsed query is stored in `res.locals.query`; Express's `req.query` is
 * read-only-ish and should not be mutated.
 */
export function validateQuery<T>(schema: ZodType<T>): RequestHandler {
  return (request, response, next) => {
    const result = schema.safeParse(request.query);
    if (!result.success) return next(result.error);
    response.locals.query = result.data;
    return next();
  };
}

export function quoteParam(request: Request): string {
  const raw = request.params.quote;
  const quote = typeof raw === 'string' ? raw.trim().toUpperCase() : '';

  if (!/^[A-Z]{3}$/.test(quote)) {
    throw new HttpError(400, 'quote must be a three-letter ISO-4217 currency code');
  }
  return quote;
}

export function idParam(request: Request): number {
  const raw = request.params.id;
  const id = Number(raw);
  if (!Number.isInteger(id) || id < 1) {
    throw new HttpError(400, 'id must be a positive integer');
  }
  return id;
}

export function queryOf<T>(response: Response): T {
  return response.locals.query as T;
}
