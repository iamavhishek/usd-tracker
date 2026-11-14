import type { AppConfig } from '../../config/env.js';
import { logger } from '../../shared/logger.js';
import type { FetchedRate, RateProvider } from './rate-provider.js';

interface FrankfurterRate {
  date: string;
  base: string;
  quote: string;
  rate: number;
}

export class RateProviderError extends Error {
  readonly status?: number;

  constructor(
    message: string,
    options?: { status?: number; cause?: unknown },
  ) {
    super(message, { cause: options?.cause });
    this.name = 'RateProviderError';
    this.status = options?.status;
  }
}

export class FrankfurterProvider implements RateProvider {
  readonly name = 'frankfurter';

  constructor(private readonly config: AppConfig) {}

  async fetchRates(base: string, quotes: string[]): Promise<FetchedRate[]> {
    if (quotes.length === 0) return [];

    const url = this.buildUrl('/rates');
    url.searchParams.set('base', base.toLowerCase());
    url.searchParams.set('quotes', quotes.join(',').toLowerCase());

    return this.parse(await this.request(url), base, quotes, 'current rates');
  }

  async fetchHistory(
    base: string,
    quote: string,
    from: string,
    to: string,
  ): Promise<FetchedRate[]> {
    const url = this.buildUrl('/rates');
    url.searchParams.set('base', base.toLowerCase());
    url.searchParams.set('quotes', quote.toLowerCase());
    url.searchParams.set('from', from);
    url.searchParams.set('to', to);

    return this.parse(await this.request(url), base, [quote], 'history').sort(
      (left, right) => left.rateDate.localeCompare(right.rateDate),
    );
  }

  private buildUrl(path: string): URL {
    return new URL(`${this.config.frankfurterBaseUrl}${path}`);
  }

  private parse(
    payload: unknown,
    base: string,
    quotes: string[],
    label: string,
  ): FetchedRate[] {
    if (!Array.isArray(payload)) {
      throw new RateProviderError(
        `Frankfurter returned an unexpected payload for ${label}`,
      );
    }

    const wanted = new Set(quotes.map((quote) => quote.toUpperCase()));
    const fetchedAt = new Date().toISOString();
    const rates: FetchedRate[] = [];

    for (const item of payload) {
      if (!isFrankfurterRate(item)) continue;

      const quote = item.quote.toUpperCase();
      if (item.base.toUpperCase() !== base.toUpperCase()) continue;
      if (!wanted.has(quote)) continue;

      rates.push({
        base: base.toUpperCase(),
        quote,
        rate: item.rate,
        rateDate: item.date,
        fetchedAt,
        provider: this.name,
      });
    }

    if (rates.length === 0) {
      throw new RateProviderError(
        `Frankfurter returned no usable ${label} for ${base}/${quotes.join(',')}`,
      );
    }

    return rates;
  }

  private async request(url: URL): Promise<unknown> {
    const attempts = this.config.frankfurterRetries + 1;
    let lastError: Error | undefined;

    for (let attempt = 0; attempt < attempts; attempt += 1) {
      try {
        const response = await fetch(url, {
          headers: { accept: 'application/json' },
          signal: AbortSignal.timeout(this.config.frankfurterTimeoutMs),
        });

        if (response.ok) return await response.json();

        const error = new RateProviderError(
          `Frankfurter responded with HTTP ${response.status}`,
          { status: response.status },
        );

        if (response.status < 500 && response.status !== 429) throw error;

        lastError = error;
        logger.warn(
          `Frankfurter HTTP ${response.status} (attempt ${attempt + 1}/${attempts})`,
        );
      } catch (error) {
        if (
          error instanceof RateProviderError &&
          error.status !== undefined &&
          error.status < 500 &&
          error.status !== 429
        ) {
          throw error;
        }

        lastError = error instanceof Error ? error : new Error(String(error));
        logger.warn(
          `Frankfurter request failed (attempt ${attempt + 1}/${attempts}): ${lastError.message}`,
        );
      }

      if (attempt < attempts - 1) {
        await sleep(300 * 2 ** attempt);
      }
    }

    throw new RateProviderError(
      `Could not reach Frankfurter after ${attempts} attempt(s): ${lastError?.message ?? 'unknown error'}`,
      { cause: lastError },
    );
  }
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function isFrankfurterRate(value: unknown): value is FrankfurterRate {
  if (typeof value !== 'object' || value === null) return false;
  const candidate = value as Record<string, unknown>;

  return (
    typeof candidate.date === 'string' &&
    /^\d{4}-\d{2}-\d{2}$/.test(candidate.date) &&
    typeof candidate.base === 'string' &&
    typeof candidate.quote === 'string' &&
    typeof candidate.rate === 'number' &&
    Number.isFinite(candidate.rate) &&
    candidate.rate > 0
  );
}
