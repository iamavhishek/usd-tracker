import {
  index,
  integer,
  real,
  sqliteTable,
  text,
  uniqueIndex,
} from 'drizzle-orm/sqlite-core';

/**
 * Raw observations of a rate. A row is only written when the published rate
 * (or its publication date) changes, so a 60-second poll does not create a
 * row per minute for an unchanged daily rate.
 */
export const rateSnapshots = sqliteTable(
  'rate_snapshots',
  {
    id: integer('id').primaryKey({ autoIncrement: true }),
    base: text('base').notNull(),
    quote: text('quote').notNull(),
    rate: real('rate').notNull(),
    rateDate: text('rate_date').notNull(),
    provider: text('provider').notNull(),
    fetchedAt: text('fetched_at').notNull(),
  },
  (table) => [
    index('rate_snapshots_quote_id_idx').on(table.quote, table.id),
    uniqueIndex('rate_snapshots_quote_date_rate_uq').on(
      table.quote,
      table.rateDate,
      table.rate,
    ),
  ],
);

/**
 * An FCM registration token and the currency that device cares about.
 */
export const devices = sqliteTable(
  'devices',
  {
    id: integer('id').primaryKey({ autoIncrement: true }),
    token: text('token').notNull().unique(),
    platform: text('platform', {
      enum: ['android', 'ios', 'web', 'unknown'],
    })
      .notNull()
      .default('unknown'),
    quote: text('quote').notNull(),
    enabled: integer('enabled', { mode: 'boolean' }).notNull().default(true),
    createdAt: text('created_at').notNull(),
    updatedAt: text('updated_at').notNull(),
    lastSeenAt: text('last_seen_at').notNull(),
  },
  (table) => [
    index('devices_quote_enabled_idx').on(table.quote, table.enabled),
  ],
);

/**
 * Threshold alerts. They are edge-triggered: a push is sent when the rate
 * crosses the threshold, never on every poll while it stays above/below.
 */
export const alertRules = sqliteTable(
  'alert_rules',
  {
    id: integer('id').primaryKey({ autoIncrement: true }),
    name: text('name'),
    base: text('base').notNull(),
    quote: text('quote').notNull(),
    condition: text('condition', { enum: ['above', 'below'] }).notNull(),
    threshold: real('threshold').notNull(),
    enabled: integer('enabled', { mode: 'boolean' }).notNull().default(true),
    cooldownSeconds: integer('cooldown_seconds').notNull(),
    lastTriggeredAt: text('last_triggered_at'),
    createdAt: text('created_at').notNull(),
    updatedAt: text('updated_at').notNull(),
  },
  (table) => [
    index('alert_rules_quote_enabled_idx').on(table.quote, table.enabled),
  ],
);

/**
 * Delivery log for every push we attempt (including skipped attempts when
 * Firebase is not configured), useful for debugging and for the app's inbox.
 */
export const notifications = sqliteTable(
  'notifications',
  {
    id: integer('id').primaryKey({ autoIncrement: true }),
    type: text('type', {
      enum: ['rate-alert', 'rate-change', 'rate-tick', 'test'],
    }).notNull(),
    title: text('title').notNull(),
    body: text('body').notNull(),
    base: text('base').notNull(),
    quote: text('quote').notNull(),
    rate: real('rate'),
    deviceCount: integer('device_count').notNull().default(0),
    successCount: integer('success_count').notNull().default(0),
    failureCount: integer('failure_count').notNull().default(0),
    skipped: integer('skipped', { mode: 'boolean' }).notNull().default(false),
    skippedReason: text('skipped_reason'),
    createdAt: text('created_at').notNull(),
  },
  (table) => [index('notifications_created_at_idx').on(table.createdAt)],
);

/**
 * Small key/value bag for runtime state (last poll result, cleanup timestamps).
 */
export const appState = sqliteTable('app_state', {
  key: text('key').primaryKey(),
  value: text('value').notNull(),
  updatedAt: text('updated_at').notNull(),
});

export type RateSnapshot = typeof rateSnapshots.$inferSelect;
export type NewRateSnapshot = typeof rateSnapshots.$inferInsert;
export type Device = typeof devices.$inferSelect;
export type NewDevice = typeof devices.$inferInsert;
export type AlertRule = typeof alertRules.$inferSelect;
export type Notification = typeof notifications.$inferSelect;
export type NewNotification = typeof notifications.$inferInsert;
