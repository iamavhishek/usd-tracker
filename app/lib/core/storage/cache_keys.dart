abstract final class CacheKeys {
  static const String box = 'usd_tracker_cache';
  static const String overview = 'rates_overview';

  static String history(String quote) => 'rates_history_${quote.toUpperCase()}';
}
