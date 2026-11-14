import { z } from 'zod';

const quoteCode = z
  .string()
  .trim()
  .transform((value) => value.toUpperCase())
  .pipe(z.string().regex(/^[A-Z]{3}$/, 'quote must be a 3-letter currency code'));

export const registerDeviceSchema = z.object({
  token: z.string().trim().min(10).max(4096),
  platform: z.enum(['android', 'ios', 'web']).optional(),
  quote: quoteCode.optional(),
});

export type RegisterDeviceInput = z.infer<typeof registerDeviceSchema>;
