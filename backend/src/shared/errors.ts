import type {
  ErrorRequestHandler,
  NextFunction,
  Request,
  RequestHandler,
  Response,
} from 'express';
import { ZodError } from 'zod';
import { logger } from './logger.js';

export class HttpError extends Error {
  constructor(
    readonly statusCode: number,
    message: string,
    readonly details?: unknown,
  ) {
    super(message);
    this.name = 'HttpError';
  }
}

type AsyncHandler = (
  request: Request,
  response: Response,
  next: NextFunction,
) => unknown | Promise<unknown>;

export const asyncHandler = (handler: AsyncHandler): RequestHandler => {
  return (request, response, next) => {
    void Promise.resolve(handler(request, response, next)).catch(next);
  };
};

export const notFoundHandler: RequestHandler = (request, response) => {
  response.status(404).json({
    statusCode: 404,
    message: `Route ${request.method} ${request.originalUrl} not found`,
  });
};

export const errorHandler: ErrorRequestHandler = (
  error,
  _request,
  response,
  _next,
) => {
  if (response.headersSent) return;

  if (error instanceof ZodError) {
    response.status(400).json({
      statusCode: 400,
      message: error.issues.map((issue) => issue.message).join('; '),
      errors: error.issues,
    });
    return;
  }

  if (error instanceof HttpError) {
    response.status(error.statusCode).json({
      statusCode: error.statusCode,
      message: error.message,
      ...(error.details === undefined ? {} : { details: error.details }),
    });
    return;
  }

  const message = error instanceof Error ? error.message : String(error);
  logger.error(`Unhandled request error: ${message}`, error);
  response.status(500).json({
    statusCode: 500,
    message: 'Internal server error',
  });
};
