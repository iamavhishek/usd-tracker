import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    AppLogger.e('${bloc.runtimeType} failed', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase<Object?> bloc, Change<Object?> change) {
    if (kDebugMode) {
      AppLogger.d(
        '${bloc.runtimeType}: ${change.currentState.runtimeType} → '
        '${change.nextState.runtimeType}',
      );
    }
    super.onChange(bloc, change);
  }
}
