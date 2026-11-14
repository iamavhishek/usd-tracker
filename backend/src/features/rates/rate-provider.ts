export interface FetchedRate {
  base: string;
  quote: string;
  rate: number;
  /** Publication date of the rate in ISO `YYYY-MM-DD` form. */
  rateDate: string;
  /** When this service fetched the value (ISO-8601). */
  fetchedAt: string;
  provider: string;
}

export interface RateProvider {
  readonly name: string;
  fetchRates(base: string, quotes: string[]): Promise<FetchedRate[]>;
  fetchHistory(
    base: string,
    quote: string,
    from: string,
    to: string,
  ): Promise<FetchedRate[]>;
}
