import { existsSync, readFileSync } from 'node:fs';
import {
  applicationDefault,
  cert,
  getApp,
  getApps,
  initializeApp,
  type Credential,
  type ServiceAccount,
} from 'firebase-admin/app';
import {
  getMessaging,
  type Messaging,
  type MulticastMessage,
} from 'firebase-admin/messaging';
import type { AppConfig } from '../../config/env.js';
import { logger } from '../../shared/logger.js';
import type { FcmSendResult, PushMessage } from './notification.types.js';

const MAX_TOKENS_PER_REQUEST = 500;

const INVALID_TOKEN_CODES = new Set([
  'messaging/registration-token-not-registered',
  'messaging/invalid-registration-token',
  'messaging/invalid-argument',
]);

export class FcmService {
  private messaging: Messaging | null = null;
  private initializationError: string | null = null;

  constructor(private readonly config: AppConfig) {}

  initialize(): void {
    try {
      const credential = this.resolveCredential();

      if (!credential) {
        logger.warn(
          'Firebase credentials are not configured — push notifications will be logged but not delivered',
        );
        return;
      }

      const app =
        getApps().length > 0 ? getApp() : initializeApp({ credential });
      this.messaging = getMessaging(app);
      logger.info('Firebase Cloud Messaging initialised');
    } catch (error) {
      this.initializationError =
        error instanceof Error ? error.message : String(error);
      logger.error(
        `Firebase initialisation failed: ${this.initializationError}`,
      );
    }
  }

  get isReady(): boolean {
    return this.messaging !== null;
  }

  get status(): { configured: boolean; error: string | null } {
    return {
      configured: this.messaging !== null,
      error: this.initializationError,
    };
  }

  async send(tokens: string[], message: PushMessage): Promise<FcmSendResult> {
    const unique = [...new Set(tokens.filter((token) => token.length > 0))];

    if (!this.messaging) {
      return {
        requested: unique.length,
        successCount: 0,
        failureCount: 0,
        invalidTokens: [],
        skipped: true,
        error: this.initializationError ?? 'firebase-not-configured',
      };
    }

    if (unique.length === 0) {
      return {
        requested: 0,
        successCount: 0,
        failureCount: 0,
        invalidTokens: [],
        skipped: true,
        error: 'no-tokens',
      };
    }

    let successCount = 0;
    let failureCount = 0;
    let lastError: string | undefined;
    const invalidTokens: string[] = [];

    for (
      let offset = 0;
      offset < unique.length;
      offset += MAX_TOKENS_PER_REQUEST
    ) {
      const chunk = unique.slice(offset, offset + MAX_TOKENS_PER_REQUEST);

      try {
        const response = await this.messaging.sendEachForMulticast(
          this.buildMessage(chunk, message),
        );

        successCount += response.successCount;
        failureCount += response.failureCount;

        response.responses.forEach((result, index) => {
          if (result.success) return;
          const code = result.error?.code;
          if (code && INVALID_TOKEN_CODES.has(code)) {
            invalidTokens.push(chunk[index]);
            return;
          }
          logger.warn(
            `FCM delivery failed for one token: ${code ?? result.error?.message ?? 'unknown error'}`,
          );
        });
      } catch (error) {
        const messageText =
          error instanceof Error ? error.message : String(error);
        failureCount += chunk.length;
        lastError = messageText;
        logger.error(`FCM batch failed: ${messageText}`);
      }
    }

    return {
      requested: unique.length,
      successCount,
      failureCount,
      invalidTokens,
      skipped: false,
      ...(lastError ? { error: lastError } : {}),
    };
  }

  private resolveCredential(): Credential | null {
    if (this.config.firebaseServiceAccountJson) {
      return cert(
        parseServiceAccount(
          this.config.firebaseServiceAccountJson,
          'FIREBASE_SERVICE_ACCOUNT_JSON',
        ),
      );
    }

    if (this.config.firebaseServiceAccountBase64) {
      return cert(
        parseServiceAccount(
          Buffer.from(
            this.config.firebaseServiceAccountBase64,
            'base64',
          ).toString('utf8'),
          'FIREBASE_SERVICE_ACCOUNT_BASE64',
        ),
      );
    }

    if (this.config.firebaseServiceAccountPath) {
      if (!existsSync(this.config.firebaseServiceAccountPath)) {
        logger.warn(
          `Firebase service account file not found at ${this.config.firebaseServiceAccountPath}`,
        );
        return null;
      }
      return cert(
        parseServiceAccount(
          readFileSync(this.config.firebaseServiceAccountPath, 'utf8'),
          this.config.firebaseServiceAccountPath,
        ),
      );
    }

    if (this.config.googleApplicationCredentials) {
      return applicationDefault();
    }

    return null;
  }

  private buildMessage(
    tokens: string[],
    message: PushMessage,
  ): MulticastMessage {
    return {
      tokens,
      notification: { title: message.title, body: message.body },
      data: message.data ?? {},
      android: {
        priority: 'high',
        ttl: 300_000,
        notification: {
          channelId: this.config.androidChannelId,
          sound: 'default',
          ...(this.config.androidIcon ? { icon: this.config.androidIcon } : {}),
        },
      },
    };
  }
}

interface RawServiceAccount {
  project_id?: string;
  client_email?: string;
  private_key?: string;
  projectId?: string;
  clientEmail?: string;
  privateKey?: string;
}

function parseServiceAccount(raw: string, source: string): ServiceAccount {
  try {
    const parsed = JSON.parse(raw) as RawServiceAccount;
    const projectId = parsed.project_id ?? parsed.projectId;
    const clientEmail = parsed.client_email ?? parsed.clientEmail;
    const privateKey = (parsed.private_key ?? parsed.privateKey)?.replace(
      /\\n/g,
      '\n',
    );

    if (!projectId || !clientEmail || !privateKey) {
      throw new Error('missing project_id, client_email or private_key');
    }

    return { projectId, clientEmail, privateKey };
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    throw new Error(`Invalid Firebase service account in ${source}: ${message}`);
  }
}
