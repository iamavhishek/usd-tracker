import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../utils/app_logger.dart';
import 'push_service.dart';
import 'push_status.dart';

/// Must be top-level and AOT-annotated.
@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
  } on Object catch (error) {
    AppLogger.e('Background FCM initialisation failed', error);
  }
}

/// FCM is wired in, but this build has no Firebase project files yet. If the
/// native config is missing, initialisation fails softly and the rest of the
/// app keeps working; Settings explains how to enable push.
class FirebasePushService implements PushService {
  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();
  final StreamController<String> _tokenRefresh =
      StreamController<String>.broadcast();
  final StreamController<String> _openedRoute =
      StreamController<String>.broadcast();

  StreamSubscription<RemoteMessage>? _messageSubscription;
  StreamSubscription<RemoteMessage>? _openedSubscription;
  StreamSubscription<String>? _refreshSubscription;
  Future<PushStatus>? _initialising;
  PushStatus _status = const PushStatus();

  static const String _channelId = 'usd_rates';
  static const String _channelName = 'USD rate alerts';
  static const String _channelDescription =
      'Exchange-rate alerts from your USD tracker';

  @override
  Stream<String> get tokenRefresh => _tokenRefresh.stream;

  @override
  Stream<String> get openedRoute => _openedRoute.stream;

  @override
  Future<PushStatus> initialize() {
    return _initialising ??= _initialize();
  }

  Future<PushStatus> _initialize() async {
    try {
      if (Firebase.apps.isEmpty) {
        // Reads google-services.json / GoogleService-Info.plist. Until those
        // exist this throws and push is reported as unavailable.
        await Firebase.initializeApp();
      }

      FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
      await _configureLocalNotifications();

      final NotificationSettings settings = await FirebaseMessaging.instance
          .getNotificationSettings();

      _status = switch (settings.authorizationStatus) {
        AuthorizationStatus.authorized || AuthorizationStatus.provisional =>
          const PushStatus(state: PushState.ready),
        AuthorizationStatus.denied ||
        AuthorizationStatus.deniedPermanently => const PushStatus(
          state: PushState.denied,
          reason: 'Notifications are turned off for this app.',
        ),
        AuthorizationStatus.notDetermined => const PushStatus(
          state: PushState.notDetermined,
          reason: 'Notifications have not been enabled yet.',
        ),
      };

      _messageSubscription = FirebaseMessaging.onMessage.listen(
        _showForegroundNotification,
      );
      _openedSubscription = FirebaseMessaging.onMessageOpenedApp.listen(
        _handleOpenedMessage,
      );

      final RemoteMessage? initial =
          await FirebaseMessaging.instance.getInitialMessage();
      if (initial != null) _handleOpenedMessage(initial);

      // ignore: deprecated_member_use
      _refreshSubscription = FirebaseMessaging.instance.onTokenRefresh.listen(
        _onTokenRefresh,
      );
    } on Object catch (error) {
      AppLogger.e('Push initialisation failed', error);
      _status = const PushStatus(
        state: PushState.unavailable,
        reason: 'Firebase is not configured in this build. Add the project files to enable push.',
      );
    }

    return _status;
  }

  @override
  Future<PushStatus> requestPermission() async {
    final PushStatus current = await initialize();
    if (current.state == PushState.unavailable) return current;

    try {
      final NotificationSettings settings = await FirebaseMessaging.instance
          .requestPermission(alert: true, badge: true, sound: true);

      _status = switch (settings.authorizationStatus) {
        AuthorizationStatus.authorized || AuthorizationStatus.provisional =>
          const PushStatus(state: PushState.ready),
        AuthorizationStatus.denied ||
        AuthorizationStatus.deniedPermanently => const PushStatus(
          state: PushState.denied,
          reason: 'Notifications are turned off for this app.',
        ),
        AuthorizationStatus.notDetermined => const PushStatus(
          state: PushState.notDetermined,
          reason: 'Notifications have not been enabled yet.',
        ),
      };
    } on Object catch (error) {
      AppLogger.e('Notification permission request failed', error);
      _status = const PushStatus(
        state: PushState.unavailable,
        reason: 'Notifications could not be enabled on this device.',
      );
    }

    return _status;
  }

  @override
  Future<String?> getToken() async {
    final PushStatus status = await initialize();
    if (status.state != PushState.ready) return null;

    try {
      // The backend multicasts to FCM registration tokens; v17 deprecates
      // getToken in favour of Firebase Installation IDs, which firebase-admin
      // does not target the same way. Revisit when the backend migrates.
      // ignore: deprecated_member_use
      return await FirebaseMessaging.instance.getToken();
    } on Object catch (error) {
      AppLogger.e('Could not obtain an FCM token', error);
      return null;
    }
  }

  Future<void> _configureLocalNotifications() async {
    await _local.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final String? payload = response.payload;
        if (payload == null) return;
        try {
          final Object? data = jsonDecode(payload);
          if (data is Map<String, dynamic>) _emitRoute(data['route']);
        } on Object {
          // Ignore malformed local-notification payloads.
        }
      },
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
    );

    await _local
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  void _onTokenRefresh(String token) {
    _tokenRefresh.add(token);
  }

  void _handleOpenedMessage(RemoteMessage message) {
    _emitRoute(message.data['route']);
  }

  void _emitRoute(Object? route) {
    if (route is String && route.startsWith('/') && route.isNotEmpty) {
      _openedRoute.add(route);
    }
  }

  Future<void> _showForegroundNotification(RemoteMessage message) async {
    final RemoteNotification? notification = message.notification;
    if (notification == null) return;

    await _local.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  /// Called only if the service is ever torn down (tests, hot restart).
  Future<void> dispose() async {
    await _messageSubscription?.cancel();
    await _openedSubscription?.cancel();
    await _refreshSubscription?.cancel();
    await _tokenRefresh.close();
    await _openedRoute.close();
  }
}
