import type { AlertCondition } from '../alerts/alert-evaluator.js';
import type { PushMessage } from './notification.types.js';

const rateFormatter = new Intl.NumberFormat('en-US', {
  maximumFractionDigits: 4,
});

export interface AlertMessageInput {
  base: string;
  quote: string;
  rate: number;
  rateDate: string;
  condition: AlertCondition;
  threshold: number;
  ruleName: string | null;
  alertId?: number;
}

export interface RateChangeMessageInput {
  base: string;
  quote: string;
  rate: number;
  previousRate: number;
  rateDate: string;
  changePercent: number;
}

export interface TickMessageInput {
  base: string;
  quote: string;
  rate: number;
  rateDate: string;
}

export interface TestMessageInput {
  base: string;
  quote: string;
  title?: string;
  body?: string;
}

export function buildAlertMessage(input: AlertMessageInput): PushMessage {
  const rate = formatRate(input.rate);
  const threshold = formatRate(input.threshold);
  const relation = input.condition === 'above' ? 'above' : 'below';

  return {
    title:
      input.ruleName?.trim() ||
      `${input.base}/${input.quote} ${relation} ${threshold}`,
    body: `1 ${input.base} = ${rate} ${input.quote} — ${relation} your ${threshold} target.`,
    data: {
      type: 'rate-alert',
      base: input.base,
      quote: input.quote,
      rate: String(input.rate),
      rateDate: input.rateDate,
      condition: input.condition,
      threshold: String(input.threshold),
      ...(input.alertId !== undefined ? { alertId: String(input.alertId) } : {}),
      route: `/rates/${input.quote}`,
    },
  };
}

export function buildRateChangeMessage(
  input: RateChangeMessageInput,
): PushMessage {
  const change = formatPercent(input.changePercent);

  return {
    title: `${input.base}/${input.quote} moved ${change}`,
    body: `1 ${input.base} = ${formatRate(input.rate)} ${input.quote} (was ${formatRate(input.previousRate)}).`,
    data: {
      type: 'rate-change',
      base: input.base,
      quote: input.quote,
      rate: String(input.rate),
      previousRate: String(input.previousRate),
      changePercent: String(input.changePercent),
      rateDate: input.rateDate,
      route: `/rates/${input.quote}`,
    },
  };
}

export function buildTickMessage(input: TickMessageInput): PushMessage {
  return {
    title: `${input.base}/${input.quote} update`,
    body: `1 ${input.base} = ${formatRate(input.rate)} ${input.quote} (${input.rateDate}).`,
    data: {
      type: 'rate-tick',
      base: input.base,
      quote: input.quote,
      rate: String(input.rate),
      rateDate: input.rateDate,
      route: `/rates/${input.quote}`,
    },
  };
}

export function buildTestMessage(input: TestMessageInput): PushMessage {
  return {
    title: input.title?.trim() || 'USD Tracker test',
    body:
      input.body?.trim() ||
      `Push notifications are working for ${input.base}/${input.quote}.`,
    data: {
      type: 'test',
      base: input.base,
      quote: input.quote,
      route: `/rates/${input.quote}`,
    },
  };
}

function formatRate(value: number): string {
  return rateFormatter.format(value);
}

function formatPercent(value: number): string {
  const sign = value > 0 ? '+' : '';
  return `${sign}${value.toFixed(2)}%`;
}
