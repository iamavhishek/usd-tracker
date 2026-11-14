import { afterAll, beforeAll, describe, expect, it } from 'bun:test';
import type { Express } from 'express';
import request from 'supertest';
import { createApp } from '../src/app.js';
import { loadConfig } from '../src/config/env.js';
import { createDatabase, type DatabaseConnection } from '../src/db/database.js';
import { rateSnapshots } from '../src/db/schema.js';
import { FcmService } from '../src/features/notifications/fcm.service.js';
import type {
  FetchedRate,
  RateProvider,
} from '../src/features/rates/rate-provider.js';

const API_KEY = 'test-key';
const CRON_SECRET = 'test-cron';

class FakeProvider implements RateProvider {
  readonly name = 'fake';
  current = 150.37;
  rateDate = '2026-11-13';

  async fetchRates(base: string, quotes: string[]): Promise<FetchedRate[]> {
    return quotes.map((quote) => ({
      base,
      quote,
      rate: this.current,
      rateDate: this.rateDate,
      fetchedAt: new Date().toISOString(),
      provider: this.name,
    }));
  }

  async fetchHistory(
    base: string,
    quote: string,
    _from: string,
    to: string,
  ): Promise<FetchedRate[]> {
    return [
      {
        base,
        quote,
        rate: 149.9,
        rateDate: to,
        fetchedAt: `${to}T00:00:00.000Z`,
        provider: this.name,
      },
    ];
  }
}

const config = loadConfig({
  NODE_ENV: 'test',
  TURSO_DATABASE_URL: ':memory:',
  DATABASE_AUTO_MIGRATE: 'true',
  MIGRATIONS_DIR: `${process.cwd()}/drizzle`,
  API_KEY,
  CRON_SECRET,
  BASE_CURRENCY: 'USD',
  TRACKED_QUOTES: 'NPR',
  SIGNIFICANT_CHANGE_PERCENT: '0',
  NOTIFY_EVERY_TICK: 'false',
  FIREBASE_SERVICE_ACCOUNT_PATH: '',
  FIREBASE_SERVICE_ACCOUNT_JSON: '',
  FIREBASE_SERVICE_ACCOUNT_BASE64: '',
  GOOGLE_APPLICATION_CREDENTIALS: '',
});

const provider = new FakeProvider();
const fcm = new FcmService(config);
let database: DatabaseConnection;
let app: Express;

beforeAll(async () => {
  database = await createDatabase(config);
  app = await createApp({ config, database, provider, fcm });
});

afterAll(() => {
  database.close();
});

const server = () => request(app);

describe('USD Tracker API (e2e)', () => {
  it('reports health and missing FCM configuration', async () => {
    const response = await server().get('/api/v1/health').expect(200);

    expect(response.body.database.ok).toBe(true);
    expect(response.body.fcm.configured).toBe(false);
    expect(response.body.rate.pollMode).toBe('external-cron');
  });

  it('protects admin and cron endpoints', async () => {
    await server().post('/api/v1/rates/refresh').expect(401);
    await server().get('/api/v1/cron/rates').expect(401);
  });

  it('polls through the cron endpoint and serves the rate', async () => {
    const poll = await server()
      .post('/api/v1/cron/rates')
      .set('x-cron-secret', CRON_SECRET)
      .expect(200);

    expect(poll.body.status).toBe('ok');
    expect(poll.body.rates[0].rate).toBe(150.37);

    const rate = await server().get('/api/v1/rates/NPR').expect(200);
    expect(rate.body.rate).toBe(150.37);

    const overview = await server().get('/api/v1/rates').expect(200);
    expect(overview.body.rates[0].quote).toBe('NPR');
  });

  it('registers a device and creates an alert', async () => {
    const device = await server()
      .post('/api/v1/devices')
      .set('x-api-key', API_KEY)
      .send({
        token: 'e2e-device-token-0123456789',
        platform: 'android',
        quote: 'NPR',
      })
      .expect(201);

    expect(device.body.quote).toBe('NPR');

    const alert = await server()
      .post('/api/v1/alerts')
      .set('x-api-key', API_KEY)
      .send({ quote: 'NPR', condition: 'above', threshold: 151 })
      .expect(201);

    expect(alert.body.condition).toBe('above');
  });

  it('turns a crossing into a push attempt and logs it', async () => {
    provider.current = 151.5;
    provider.rateDate = '2026-11-14';

    const poll = await server()
      .get('/api/v1/cron/rates')
      .set('x-cron-secret', CRON_SECRET)
      .expect(200);

    expect(poll.body.status).toBe('ok');
    expect(poll.body.notifications.skipped).toBeGreaterThanOrEqual(1);

    const notifications = await server()
      .get('/api/v1/notifications')
      .set('x-api-key', API_KEY)
      .expect(200);

    const alertPush = notifications.body.find(
      (entry: { type: string }) => entry.type === 'rate-alert',
    );
    expect(alertPush.skipped).toBe(true);
    expect(alertPush.skippedReason).toBe('firebase-not-configured');
  });

  it('prunes rate history older than seven days', async () => {
    await database.db
      .insert(rateSnapshots)
      .values({
        base: 'USD',
        quote: 'NPR',
        rate: 100,
        rateDate: '2020-01-01',
        provider: 'test',
        fetchedAt: '2020-01-01T00:00:00.000Z',
      })
      .run();

    const response = await server()
      .post('/api/v1/cron/maintenance')
      .set('x-cron-secret', CRON_SECRET)
      .expect(200);

    expect(response.body.snapshotsDeleted).toBeGreaterThanOrEqual(1);
  });

  it('runs retention through the cron endpoint', async () => {
    const response = await server()
      .post('/api/v1/cron/maintenance')
      .set('x-cron-secret', CRON_SECRET)
      .expect(200);

    expect(typeof response.body.snapshotsDeleted).toBe('number');
    expect(typeof response.body.notificationsDeleted).toBe('number');
  });
});
