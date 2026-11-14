export type PollTrigger = 'cron' | 'manual';
export type PollStatus = 'ok' | 'error' | 'skipped';

export interface PolledRate {
  quote: string;
  rate: number;
  rateDate: string;
  previousRate: number | null;
  changed: boolean;
}

export interface PollNotificationTally {
  sent: number;
  failed: number;
  skipped: number;
}

export interface PollSummary {
  status: PollStatus;
  trigger: PollTrigger;
  at: string;
  finishedAt: string;
  durationMs: number;
  rates: PolledRate[];
  notifications: PollNotificationTally;
  error?: string;
}
