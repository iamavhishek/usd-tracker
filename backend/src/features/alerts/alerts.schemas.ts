import { z } from 'zod';

const quoteCode = z
  .string()
  .trim()
  .transform((value) => value.toUpperCase())
  .pipe(z.string().regex(/^[A-Z]{3}$/, 'quote must be a 3-letter currency code'));

export const createAlertSchema = z.object({
  name: z.string().trim().max(80).optional(),
  quote: quoteCode,
  condition: z.enum(['above', 'below']),
  threshold: z.number().min(0.000001).max(1_000_000_000),
  enabled: z.boolean().optional(),
  cooldownSeconds: z.number().int().min(0).max(604_800).optional(),
});

export const updateAlertSchema = createAlertSchema.partial();

export type CreateAlertInput = z.infer<typeof createAlertSchema>;
export type UpdateAlertInput = z.infer<typeof updateAlertSchema>;
