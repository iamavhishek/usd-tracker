import { resolve } from 'node:path';
import { z } from 'zod';

const envSchema = z.object({
  NODE_ENV: z.enum(['development', 'production', 'test']).default('development'),
  PORT: z.coerce.number().int().positive().max(65_535).default(3000),
  CORS_ORIGINS: z.string().default('*'),

  BASE_CURRENCY: z.string().regex(/^[A-Za-z]{3}$/).default('USD'),
  TRACKED_QUOTES: z.string().default('NPR'),

  FRANKFURTER_BASE_URL: z
    .string()
    .url()
    .default('https://api.frankfurter.dev/v2'),
  FRANKFURTER_TIMEOUT_MS: z.coerce.number().int().min(1_000).max(60_000).default(10_000),
  FRANKFURTER_RETRIES: z.coerce.number().int().min(0).max(5).default(2),

  TURSO_DATABASE_URL: z.string().default('file:./data/usd-tracker.db'),
  TURSO_AUTH_TOKEN: z.string().default(''),
  DATABASE_AUTO_MIGRATE: z.string().default('true'),
  MIGRATIONS_DIR: z.string().default('./drizzle'),
  HISTORY_RETENTION_DAYS: z.coerce.number().int().min(1).default(7),
  NOTIFICATION_RETENTION_DAYS: z.coerce.number().int().min(1).default(7),

  API_KEY: z.string().default(''),
  CRON_SECRET: z.string().default(''),

  NOTIFY_EVERY_TICK: z.string().default('false'),
  SIGNIFICANT_CHANGE_PERCENT: z.coerce.number().min(0).max(100).default(0.5),
  ALERT_COOLDOWN_SECONDS: z.coerce.number().int().min(0).default(21_600),

  FCM_ANDROID_CHANNEL_ID: z.string().default('usd_rates'),
  FCM_ANDROID_ICON: z.string().default('ic_stat_usd'),
  FCM_WEB_ICON: z.string().default(''),

  FIREBASE_SERVICE_ACCOUNT_PATH: z.string().default(''),
  FIREBASE_SERVICE_ACCOUNT_JSON: z.string().default(''),
  FIREBASE_SERVICE_ACCOUNT_BASE64: z.string().default(''),
  GOOGLE_APPLICATION_CREDENTIALS: z.string().default(''),
});

export interface AppConfig {
  nodeEnv: 'development' | 'production' | 'test';
  isProduction: boolean;
  port: number;
  corsOrigins: true | string[];

  baseCurrency: string;
  quotes: string[];

  frankfurterBaseUrl: string;
  frankfurterTimeoutMs: number;
  frankfurterRetries: number;

  databaseUrl: string;
  tursoAuthToken?: string;
  databaseAutoMigrate: boolean;
  migrationsDir: string;
  historyRetentionDays: number;
  notificationRetentionDays: number;

  apiKey?: string;
  cronSecret?: string;

  notifyEveryTick: boolean;
  significantChangePercent: number;
  alertCooldownSeconds: number;

  androidChannelId: string;
  androidIcon?: string;
  webIcon?: string;

  firebaseServiceAccountPath?: string;
  firebaseServiceAccountJson?: string;
  firebaseServiceAccountBase64?: string;
  googleApplicationCredentials?: string;
}

const optional = (value: string): string | undefined => {
  const trimmed = value.trim();
  return trimmed.length > 0 ? trimmed : undefined;
};

const boolean = (value: string): boolean => value === 'true' || value === '1';

export function loadConfig(
  source: Record<string, string | undefined> = process.env,
): AppConfig {
  const result = envSchema.safeParse(source);

  if (!result.success) {
    const details = result.error.issues
      .map((issue) => `${issue.path.join('.')}: ${issue.message}`)
      .join('; ');
    throw new Error(`Invalid environment configuration: ${details}`);
  }

  const env = result.data;
  const baseCurrency = env.BASE_CURRENCY.toUpperCase();
  const quotes = [
    ...new Set(
      env.TRACKED_QUOTES.split(',')
        .map((quote) => quote.trim().toUpperCase())
        .filter(Boolean),
    ),
  ].filter((quote) => quote !== baseCurrency);

  if (quotes.length === 0) {
    throw new Error(
      'TRACKED_QUOTES must contain at least one currency different from BASE_CURRENCY',
    );
  }

  const invalidQuote = quotes.find((quote) => !/^[A-Z]{3}$/.test(quote));
  if (invalidQuote) {
    throw new Error(`Invalid ISO-4217 currency in TRACKED_QUOTES: ${invalidQuote}`);
  }

  return {
    nodeEnv: env.NODE_ENV,
    isProduction: env.NODE_ENV === 'production',
    port: env.PORT,
    corsOrigins:
      env.CORS_ORIGINS.trim() === '*'
        ? true
        : env.CORS_ORIGINS.split(',')
            .map((origin) => origin.trim())
            .filter(Boolean),

    baseCurrency,
    quotes,

    frankfurterBaseUrl: env.FRANKFURTER_BASE_URL.replace(/\/+$/, ''),
    frankfurterTimeoutMs: env.FRANKFURTER_TIMEOUT_MS,
    frankfurterRetries: env.FRANKFURTER_RETRIES,

    databaseUrl: env.TURSO_DATABASE_URL,
    tursoAuthToken: optional(env.TURSO_AUTH_TOKEN),
    // Serverless cold starts must not depend on a bundled drizzle/ folder.
    // Run `bun run db:migrate` against Turso as part of deployment.
    databaseAutoMigrate:
      boolean(env.DATABASE_AUTO_MIGRATE) && process.env.VERCEL !== '1',
    migrationsDir: resolve(process.cwd(), env.MIGRATIONS_DIR),
    historyRetentionDays: env.HISTORY_RETENTION_DAYS,
    notificationRetentionDays: env.NOTIFICATION_RETENTION_DAYS,

    apiKey: optional(env.API_KEY),
    cronSecret: optional(env.CRON_SECRET),

    notifyEveryTick: boolean(env.NOTIFY_EVERY_TICK),
    significantChangePercent: env.SIGNIFICANT_CHANGE_PERCENT,
    alertCooldownSeconds: env.ALERT_COOLDOWN_SECONDS,

    androidChannelId: env.FCM_ANDROID_CHANNEL_ID,
    androidIcon: optional(env.FCM_ANDROID_ICON),
    webIcon: optional(env.FCM_WEB_ICON),

    firebaseServiceAccountPath: env.FIREBASE_SERVICE_ACCOUNT_PATH
      ? resolve(process.cwd(), env.FIREBASE_SERVICE_ACCOUNT_PATH)
      : undefined,
    firebaseServiceAccountJson: optional(env.FIREBASE_SERVICE_ACCOUNT_JSON),
    firebaseServiceAccountBase64: optional(env.FIREBASE_SERVICE_ACCOUNT_BASE64),
    googleApplicationCredentials: optional(env.GOOGLE_APPLICATION_CREDENTIALS),
  };
}
