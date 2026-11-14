import 'dart:async';
import 'dart:ui' show PlatformDispatcher;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:usd_tracker/firebase_options.dart';

import 'app/app.dart';
import 'app/di/service_locator.dart';
import 'app/router/app_router.dart';
import 'core/bloc/app_bloc_observer.dart';
import 'core/config/app_env.dart';
import 'core/services/push_service.dart';
import 'core/storage/cache_keys.dart';
import 'core/utils/app_logger.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = const AppBlocObserver();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    AppLogger.e('Flutter error', details.exception, details.stack);
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    AppLogger.e('Uncaught platform error', error, stack);
    return true;
  };

  await Hive.initFlutter();
  final Box<String> cacheBox = await Hive.openBox<String>(CacheKeys.box);

  final AppEnv env = AppEnv.fromDefines();
  configureDependencies(env, cacheBox);

  // Wire push listeners without prompting; the prompt is requested from
  // Settings when the user enables notifications.
  unawaited(getIt<PushService>().initialize());

  runApp(App(router: createRouter()));
}
