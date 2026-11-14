import 'package:flutter/foundation.dart';

/// Thin wrapper so logging can be swapped for a crash reporter later.
abstract final class AppLogger {
  static void d(String message) {
    if (kDebugMode) debugPrint(message);
  }

  static void e(String message, [Object? error, StackTrace? stackTrace]) {
    if (!kDebugMode) return;
    debugPrint(message);
    if (error != null) debugPrint('$error');
    if (stackTrace != null) debugPrint('$stackTrace');
  }
}
