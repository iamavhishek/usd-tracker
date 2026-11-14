import { describe, expect, it } from 'bun:test';
import { shouldTriggerAlert } from '../src/features/alerts/alert-evaluator.js';

const now = new Date('2026-11-13T12:00:00.000Z');

describe('shouldTriggerAlert', () => {
  it('triggers when the rate crosses above the threshold', () => {
    expect(
      shouldTriggerAlert({
        condition: 'above',
        threshold: 150,
        previousRate: 149.9,
        currentRate: 150.5,
        lastTriggeredAt: null,
        cooldownSeconds: 0,
        now,
      }),
    ).toBe(true);
  });

  it('triggers when the rate crosses below the threshold', () => {
    expect(
      shouldTriggerAlert({
        condition: 'below',
        threshold: 140,
        previousRate: 141,
        currentRate: 139.5,
        lastTriggeredAt: null,
        cooldownSeconds: 0,
        now,
      }),
    ).toBe(true);
  });

  it('does not re-trigger while the rate stays above', () => {
    expect(
      shouldTriggerAlert({
        condition: 'above',
        threshold: 150,
        previousRate: 151,
        currentRate: 152,
        lastTriggeredAt: null,
        cooldownSeconds: 0,
        now,
      }),
    ).toBe(false);
  });

  it('does not trigger without a previous observation', () => {
    expect(
      shouldTriggerAlert({
        condition: 'below',
        threshold: 140,
        previousRate: null,
        currentRate: 139,
        lastTriggeredAt: null,
        cooldownSeconds: 0,
        now,
      }),
    ).toBe(false);
  });

  it('respects the cooldown', () => {
    expect(
      shouldTriggerAlert({
        condition: 'above',
        threshold: 150,
        previousRate: 149,
        currentRate: 151,
        lastTriggeredAt: '2026-11-13T11:30:00.000Z',
        cooldownSeconds: 3600,
        now,
      }),
    ).toBe(false);
  });
});
