import { afterEach, describe, expect, it } from 'bun:test';
import { loadConfig } from '../src/config/env.js';
import { FrankfurterProvider } from '../src/features/rates/frankfurter.js';

const originalFetch = globalThis.fetch;

const config = loadConfig({
  BASE_CURRENCY: 'USD',
  TRACKED_QUOTES: 'NPR',
  FRANKFURTER_RETRIES: '0',
});

afterEach(() => {
  globalThis.fetch = originalFetch;
});

describe('FrankfurterProvider', () => {
  it('maps current rates', async () => {
    globalThis.fetch = (async () =>
      new Response(
        JSON.stringify([
          { date: '2026-11-14', base: 'USD', quote: 'NPR', rate: 150.69 },
        ]),
        { status: 200 },
      )) as unknown as typeof fetch;

    const rates = await new FrankfurterProvider(config).fetchRates('USD', [
      'NPR',
    ]);

    expect(rates[0]).toMatchObject({
      quote: 'NPR',
      rate: 150.69,
      rateDate: '2026-11-14',
      provider: 'frankfurter',
    });
  });

  it('sorts history ascending', async () => {
    globalThis.fetch = (async () =>
      new Response(
        JSON.stringify([
          { date: '2026-11-14', base: 'USD', quote: 'NPR', rate: 150.69 },
          { date: '2026-11-12', base: 'USD', quote: 'NPR', rate: 150.37 },
        ]),
        { status: 200 },
      )) as unknown as typeof fetch;

    const rates = await new FrankfurterProvider(config).fetchHistory(
      'USD',
      'NPR',
      '2026-11-12',
      '2026-11-14',
    );

    expect(rates.map((rate) => rate.rateDate)).toEqual([
      '2026-11-12',
      '2026-11-14',
    ]);
  });

  it('rejects unusable payloads', async () => {
    globalThis.fetch = (async () =>
      new Response('[]', { status: 200 })) as unknown as typeof fetch;

    await expect(
      new FrankfurterProvider(config).fetchRates('USD', ['NPR']),
    ).rejects.toThrow('no usable');
  });
});
