import { desc, lt } from 'drizzle-orm';
import type { LibSQLDatabase } from 'drizzle-orm/libsql';
import {
  notifications,
  type NewNotification,
  type Notification,
} from '../../db/schema.js';
import type * as schema from '../../db/schema.js';

export class NotificationsRepository {
  constructor(private readonly db: LibSQLDatabase<typeof schema>) {}

  async create(values: NewNotification): Promise<Notification> {
    const rows = await this.db
      .insert(notifications)
      .values(values)
      .returning();
    const notification = rows[0];
    if (!notification) throw new Error('Failed to log notification');
    return notification;
  }

  async recent(limit: number): Promise<Notification[]> {
    return this.db
      .select()
      .from(notifications)
      .orderBy(desc(notifications.id))
      .limit(limit);
  }

  async deleteOlderThan(cutoffIso: string): Promise<number> {
    const rows = await this.db
      .delete(notifications)
      .where(lt(notifications.createdAt, cutoffIso))
      .returning({ id: notifications.id });
    return rows.length;
  }
}
