type LogMeta = unknown;

function line(level: string, message: string): string {
  return `${new Date().toISOString()} ${level} ${message}`;
}

export const logger = {
  info(message: string, meta?: LogMeta): void {
    console.log(line('INFO', message), meta ?? '');
  },
  warn(message: string, meta?: LogMeta): void {
    console.warn(line('WARN', message), meta ?? '');
  },
  error(message: string, meta?: LogMeta): void {
    console.error(line('ERROR', message), meta ?? '');
  },
};
