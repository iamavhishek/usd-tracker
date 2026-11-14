import 'push_status.dart';

/// Platform push abstraction. The Bloc layer talks to this interface, never to
/// Firebase directly.
abstract class PushService {
  Future<PushStatus> initialize();

  /// Requests OS permission. Call when the user enables notifications, never
  /// during startup.
  Future<PushStatus> requestPermission();

  Future<String?> getToken();

  Stream<String> get tokenRefresh;

  /// Routes carried by a tapped notification (foreground/background/launch).
  Stream<String> get openedRoute;
}
