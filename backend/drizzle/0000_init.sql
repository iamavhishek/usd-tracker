CREATE TABLE `alert_rules` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text,
	`base` text NOT NULL,
	`quote` text NOT NULL,
	`condition` text NOT NULL,
	`threshold` real NOT NULL,
	`enabled` integer DEFAULT true NOT NULL,
	`cooldown_seconds` integer NOT NULL,
	`last_triggered_at` text,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `alert_rules_quote_enabled_idx` ON `alert_rules` (`quote`,`enabled`);--> statement-breakpoint
CREATE TABLE `app_state` (
	`key` text PRIMARY KEY NOT NULL,
	`value` text NOT NULL,
	`updated_at` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `devices` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`token` text NOT NULL,
	`platform` text DEFAULT 'unknown' NOT NULL,
	`quote` text NOT NULL,
	`enabled` integer DEFAULT true NOT NULL,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL,
	`last_seen_at` text NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `devices_token_unique` ON `devices` (`token`);--> statement-breakpoint
CREATE INDEX `devices_quote_enabled_idx` ON `devices` (`quote`,`enabled`);--> statement-breakpoint
CREATE TABLE `notifications` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`type` text NOT NULL,
	`title` text NOT NULL,
	`body` text NOT NULL,
	`base` text NOT NULL,
	`quote` text NOT NULL,
	`rate` real,
	`device_count` integer DEFAULT 0 NOT NULL,
	`success_count` integer DEFAULT 0 NOT NULL,
	`failure_count` integer DEFAULT 0 NOT NULL,
	`skipped` integer DEFAULT false NOT NULL,
	`skipped_reason` text,
	`created_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `notifications_created_at_idx` ON `notifications` (`created_at`);--> statement-breakpoint
CREATE TABLE `rate_snapshots` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`base` text NOT NULL,
	`quote` text NOT NULL,
	`rate` real NOT NULL,
	`rate_date` text NOT NULL,
	`provider` text NOT NULL,
	`fetched_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `rate_snapshots_quote_id_idx` ON `rate_snapshots` (`quote`,`id`);--> statement-breakpoint
CREATE UNIQUE INDEX `rate_snapshots_quote_date_rate_uq` ON `rate_snapshots` (`quote`,`rate_date`,`rate`);