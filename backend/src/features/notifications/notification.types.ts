export type NotificationType =
  | 'rate-alert'
  | 'rate-change'
  | 'rate-tick'
  | 'test';

export interface PushMessage {
  title: string;
  body: string;
  data?: Record<string, string>;
}

export interface FcmSendResult {
  requested: number;
  successCount: number;
  failureCount: number;
  invalidTokens: string[];
  skipped: boolean;
  error?: string;
}

export interface NotificationOutcome {
  requested: number;
  deviceCount: number;
  successCount: number;
  failureCount: number;
  skipped: boolean;
  skippedReason?: string;
}
