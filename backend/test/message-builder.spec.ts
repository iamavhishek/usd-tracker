import { describe, expect, it } from 'bun:test';
import {
  buildAlertMessage,
  buildRateChangeMessage,
  buildTestMessage,
  buildTickMessage,
} from '../src/features/notifications/message.builder.js';

describe('message builder', () => {
  it('builds a threshold alert', () => {
    const message = buildAlertMessage({
      base: 'USD',
      quote: 'NPR',
      rate: 139.5,
      rateDate: '2026-11-14',
      condition: 'below',
      threshold: 140,
      ruleName: 'Buy below 140',
      alertId: 7,
    });

    expect(message.title).toBe('Buy below 140');
    expect(message.body).toContain('below your 140 target');
    expect(message.data).toMatchObject({
      type: 'rate-alert',
      quote: 'NPR',
      rate: '139.5',
      alertId: '7',
    });
  });

  it('builds a rate-change message', () => {
    const message = buildRateChangeMessage({
      base: 'USD',
      quote: 'NPR',
      rate: 151.5,
      previousRate: 150.37,
      rateDate: '2026-11-14',
      changePercent: 0.75,
    });

    expect(message.title).toBe('USD/NPR moved +0.75%');
    expect(message.body).toContain('was 150.37');
  });

  it('builds tick and test messages', () => {
    expect(
      buildTickMessage({
        base: 'USD',
        quote: 'NPR',
        rate: 150.37,
        rateDate: '2026-11-14',
      }).data?.type,
    ).toBe('rate-tick');

    expect(buildTestMessage({ base: 'USD', quote: 'NPR' }).title).toBe(
      'USD Tracker test',
    );
  });
});
