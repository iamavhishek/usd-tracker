import type { AppConfig } from '../../config/env.js';
import { AppStateRepository } from '../../db/app-state.js';
import type { RateSnapshot } from '../../db/schema.js';
import { HttpError } from '../../shared/errors.js';
import type { PollSummary } from './poll-summary.js';
import type { FetchedRate, RateProvider } from './rate-provider.js';
import { RatesRepository } from './rates.repository.js';

export interface RateResponse {
  base: string;
  quote: string;
  rate: number | null;
  rateDate: string | null;
  fetchedAt: string | null;
  provider: string | null;
  previousRate: number | null;
  change: number | null;
  changePercent: number | null;
  direction: 'up' | 'down' | 'flat' | null;
}

export interface RateOverviewResponse {
  base: string;
  rates: RateResponse[];
  lastPoll: PollSummary | null;
}

export interface HistoryPoint {
  rate: number;
  rateDate: string;
  fetchedAt: string;
}

export interface RateHistoryResponse {
  base: string;
  quote: string;
  points: HistoryPoint[];
  limit: number;
}

export interface BackfillResult {
  base: string;
  quote: string;
  from: string;
  to: string;
  fetched: number;
  inserted: number;
}

export interface IngestedRate extends FetchedRate {
  previousRate: number | null;
  previousRateDate: string | null;
  changed: boolean;
}

export class RatesService {
  constructor(
    private readonly provider: RateProvider,
    private readonly repository: RatesRepository,
    private readonly config: AppConfig,
    private readonly state: AppStateRepository,
  ) {}

  ingest(rates: FetchedRate[]): IngestedRate[] {
    const ingested: IngestedRate[] = [];

    for (const rate of rates) {
      const previous = this.repository.latest(rate.quote);
      const changed =
        !previous ||
        previous.rate !== rate.rate ||
        previous.rateDate !== rate.rateDate;

      if (changed) {
        this.repository.insert({
          base: rate.base,
          quote: rate.quote,
          rate: rate.rate,
          rateDate: rate.rateDate,
          provider: rate.provider,
          fetchedAt: rate.fetchedAt,
        });
      }

      ingested.push({
        ...rate,
        previousRate: previous?.rate ?? null,
        previousRateDate: previous?.rateDate ?? null,
        changed,
      });
    }

    return ingested;
  }

  getOverview(): RateOverviewResponse {
    return {
      base: this.config.baseCurrency,
      rates: this.config.quotes.map((quote) => {
        const current = this.repository.latest(quote);
        if (!current) return this.emptyRate(quote);
        const previous = this.repository.latestBefore(quote, current);
        return this.toDto(current, previous);
      }),
      lastPoll: this.getLastPoll(),
    };
  }

  getLatest(quote: string): RateResponse {
    this.assertTracked(quote);
    const current = this.repository.latest(quote);

    if (!current) {
      throw new HttpError(
        404,
        `No rate stored yet for ${this.config.baseCurrency}/${quote}`,
      );
    }

    const previous = this.repository.latestBefore(quote, current);
    return this.toDto(current, previous);
  }

  getHistory(quote: string, limit = 100): RateHistoryResponse {
    this.assertTracked(quote);

    const points = this.repository
      .history(quote, limit)
      .reverse()
      .map((snapshot) => ({
        rate: snapshot.rate,
        rateDate: snapshot.rateDate,
        fetchedAt: snapshot.fetchedAt,
      }));

    return { base: this.config.baseCurrency, quote, points, limit };
  }

  async backfill(quote: string, days = 30): Promise<BackfillResult> {
    this.assertTracked(quote);

    const windowDays = Math.min(
      Math.max(days, 1),
      this.config.historyRetentionDays,
    );
    const to = new Date();
    const from = new Date(to.getTime() - windowDays * 86_400_000);
    const fromDate = toDateOnly(from);
    const toDate = toDateOnly(to);

    const rates = await this.provider.fetchHistory(
      this.config.baseCurrency,
      quote,
      fromDate,
      toDate,
    );

    const inserted = this.repository.insertMany(
      rates.map((rate) => ({
        base: rate.base,
        quote: rate.quote,
        rate: rate.rate,
        rateDate: rate.rateDate,
        provider: rate.provider,
        // Historical rows are anchored to the rate date so retention treats
        // them as historical data rather than "just fetched".
        fetchedAt: `${rate.rateDate}T00:00:00.000Z`,
      })),
    );

    return {
      base: this.config.baseCurrency,
      quote,
      from: fromDate,
      to: toDate,
      fetched: rates.length,
      inserted,
    };
  }

  getLastPoll(): PollSummary | null {
    return this.state.get<PollSummary>('last_poll');
  }

  private assertTracked(quote: string): void {
    if (!this.config.quotes.includes(quote)) {
      throw new HttpError(
        400,
        `Currency ${quote} is not tracked. Configured quotes: ${this.config.quotes.join(', ')}`,
      );
    }
  }

  private toDto(current: RateSnapshot, previous?: RateSnapshot): RateResponse {
    const previousRate = previous?.rate ?? null;
    const change =
      previousRate === null ? null : round(current.rate - previousRate, 6);
    const changePercent =
      previousRate === null || previousRate === 0
        ? null
        : round(((current.rate - previousRate) / previousRate) * 100, 4);

    let direction: RateResponse['direction'] = null;
    if (change !== null) {
      direction = change > 0 ? 'up' : change < 0 ? 'down' : 'flat';
    }

    return {
      base: current.base,
      quote: current.quote,
      rate: current.rate,
      rateDate: current.rateDate,
      fetchedAt: current.fetchedAt,
      provider: current.provider,
      previousRate,
      change,
      changePercent,
      direction,
    };
  }

  private emptyRate(quote: string): RateResponse {
    return {
      base: this.config.baseCurrency,
      quote,
      rate: null,
      rateDate: null,
      fetchedAt: null,
      provider: null,
      previousRate: null,
      change: null,
      changePercent: null,
      direction: null,
    };
  }
}

function round(value: number, decimals: number): number {
  return Number(value.toFixed(decimals));
}

function toDateOnly(date: Date): string {
  return date.toISOString().slice(0, 10);
}
