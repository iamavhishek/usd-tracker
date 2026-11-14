import type { AppConfig } from '../../config/env.js';
import type { Device } from '../../db/schema.js';
import { HttpError } from '../../shared/errors.js';
import { logger } from '../../shared/logger.js';
import type { RegisterDeviceInput } from './devices.schemas.js';
import { DevicesRepository } from './devices.repository.js';

export interface DeviceSummary {
  id: number;
  platform: string;
  quote: string;
  enabled: boolean;
  registeredAt: string;
  updatedAt: string;
  tokenPreview: string;
}

export class DevicesService {
  constructor(
    private readonly repository: DevicesRepository,
    private readonly config: AppConfig,
  ) {}

  register(input: RegisterDeviceInput): DeviceSummary {
    const quote = (input.quote ?? this.config.quotes[0] ?? '').toUpperCase();
    if (!this.config.quotes.includes(quote)) {
      throw new HttpError(
        400,
        `Currency ${quote} is not tracked. Configured quotes: ${this.config.quotes.join(', ')}`,
      );
    }

    const device = this.repository.upsert({
      token: input.token.trim(),
      platform: input.platform ?? 'unknown',
      quote,
      now: new Date().toISOString(),
    });

    logger.info(
      `Registered ${device.platform} device #${device.id} for ${device.quote}`,
    );
    return this.toSummary(device);
  }

  list(): DeviceSummary[] {
    return this.repository.list().map((device) => this.toSummary(device));
  }

  remove(token: string): { removed: boolean } {
    return { removed: this.repository.remove(token.trim()) };
  }

  activeTokensForQuote(quote: string): string[] {
    return this.repository.activeTokensForQuote(quote);
  }

  removeTokens(tokens: string[]): number {
    return this.repository.removeMany(tokens);
  }

  count(): number {
    return this.repository.countActive();
  }

  private toSummary(device: Device): DeviceSummary {
    return {
      id: device.id,
      platform: device.platform,
      quote: device.quote,
      enabled: device.enabled,
      registeredAt: device.createdAt,
      updatedAt: device.updatedAt,
      tokenPreview: maskToken(device.token),
    };
  }
}

function maskToken(token: string): string {
  if (token.length <= 12) return `${token.slice(0, 4)}…`;
  return `${token.slice(0, 6)}…${token.slice(-4)}`;
}
