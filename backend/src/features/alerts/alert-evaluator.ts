export type AlertCondition = 'above' | 'below';

export interface AlertEvaluationInput {
  condition: AlertCondition;
  threshold: number;
  currentRate: number;
  previousRate: number | null;
  lastTriggeredAt?: string | null;
  cooldownSeconds: number;
  now?: Date;
}

export function isConditionMet(
  condition: AlertCondition,
  rate: number,
  threshold: number,
): boolean {
  return condition === 'above' ? rate >= threshold : rate <= threshold;
}

/**
 * Edge-triggered alert evaluation.
 *
 * A push is produced only when the rate *crosses* the threshold. This keeps a
 * minute-by-minute poll from spamming the device while the rate stays on one
 * side of the threshold. The cooldown additionally protects against a rate
 * that flaps across the threshold several times per day.
 */
export function shouldTriggerAlert(input: AlertEvaluationInput): boolean {
  if (input.previousRate === null) return false;
  if (!isConditionMet(input.condition, input.currentRate, input.threshold)) {
    return false;
  }
  if (isConditionMet(input.condition, input.previousRate, input.threshold)) {
    return false;
  }

  if (input.lastTriggeredAt && input.cooldownSeconds > 0) {
    const lastTriggeredMs = Date.parse(input.lastTriggeredAt);
    const nowMs = (input.now ?? new Date()).getTime();

    if (
      Number.isFinite(lastTriggeredMs) &&
      nowMs - lastTriggeredMs < input.cooldownSeconds * 1000
    ) {
      return false;
    }
  }

  return true;
}
