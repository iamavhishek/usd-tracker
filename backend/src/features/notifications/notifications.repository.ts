import { desc, lt } from 'drizzle-orm';
import type { BunSQLiteDatabase } from 'drizzle-orm/bun-sqlite';
import {
  notifications,
  type NewNotification,
  type Notification,
} from '../../db/schema.js';
import type * as schema from '../../db/schema.js';

export class NotificationsRepository {
  constructor(private readonly db: BunSQLiteDatabase<typeof schema>) {}

  create(values: NewNotification): Notification {
    return this.db.insert(notifications).values(values).returning().get();
  }

  recent(limit: number): Notification[] {
    return this.db
      .select()
      .from(notifications)
      .orderBy(desc(notifications.id))
      .limit(limit)
      .all();
  }

  deleteOlderThan(cutoffIso: string): number {
    return this.db
      .delete(notifications)
      .where(lt(notifications.createdAt, cutoffIso))
      .returning({ id: notifications.id })
      .all().length;
  }
}
