import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_env.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/models/view_status.dart';
import '../../../../core/services/push_service.dart';
import '../../../../core/services/push_status.dart';
import '../data/models/settings_models.dart';
import '../repo/settings_repo.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._repo, this._push, this._env)
    : super(
        SettingsState(
          baseUrl: _env.baseUrl,
          hasApiKey: _env.hasApiKey,
          quote: _env.defaultQuote,
        ),
      ) {
    _tokenSubscription = _push.tokenRefresh.listen(_onTokenRefresh);
  }

  final SettingsRepo _repo;
  final PushService _push;
  final AppEnv _env;

  late final StreamSubscription<String> _tokenSubscription;

  Future<void> load() async {
    final bool hasHealth = state.health != null;
    emit(
      state.copyWith(
        status: hasHealth ? ViewStatus.refreshing : ViewStatus.loading,
        failure: null,
      ),
    );

    final Result<HealthModel> healthResult = await _repo.fetchHealth();
    final PushStatus push = await _push.initialize();
    if (isClosed) return;

    if (healthResult.isSuccess) {
      emit(
        state.copyWith(
          status: ViewStatus.success,
          health: healthResult.requireValue,
          push: push,
          failure: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: hasHealth ? ViewStatus.success : ViewStatus.failure,
          push: push,
          failure: healthResult.requireFailure,
        ),
      );
    }
  }

  Future<void> refreshHealth() async {
    final Result<HealthModel> result = await _repo.fetchHealth();
    if (isClosed) return;

    if (result.isSuccess) {
      emit(state.copyWith(health: result.requireValue, failure: null));
    } else {
      emit(state.copyWith(failure: result.requireFailure));
    }
  }

  Future<void> enablePush() async {
    if (state.isBusy) return;

    emit(state.copyWith(isBusy: true, failure: null));
    final PushStatus permission = await _push.requestPermission();
    if (isClosed) return;

    if (permission.state != PushState.ready) {
      emit(
        state.copyWith(
          isBusy: false,
          push: permission,
          failure: const Failure.server(
            message: 'Notifications were not enabled on this device.',
          ),
        ),
      );
      return;
    }

    final String? token = await _push.getToken();
    if (isClosed) return;

    if (token == null) {
      emit(
        state.copyWith(
          isBusy: false,
          push: permission,
          failure: const Failure.server(
            message: 'Could not obtain a push token for this device.',
          ),
        ),
      );
      return;
    }

    final Result<DeviceModel> result = await _repo.registerDevice(
      token: token,
      platform: 'android',
      quote: _env.defaultQuote,
    );
    if (isClosed) return;

    if (result.isSuccess) {
      emit(
        state.copyWith(
          isBusy: false,
          device: result.requireValue,
          push: permission,
          failure: null,
        ),
      );
      unawaited(refreshHealth());
    } else {
      emit(state.copyWith(isBusy: false, failure: result.requireFailure));
    }
  }

  Future<void> disablePush() async {
    if (state.isBusy) return;

    emit(state.copyWith(isBusy: true, failure: null));
    final String? token = await _push.getToken();
    if (isClosed) return;

    if (token == null) {
      emit(
        state.copyWith(
          isBusy: false,
          failure: const Failure.server(
            message: 'Push is unavailable on this device.',
          ),
        ),
      );
      return;
    }

    final Result<void> result = await _repo.unregisterDevice(token);
    if (isClosed) return;

    if (result.isSuccess) {
      emit(state.copyWith(isBusy: false, device: null, failure: null));
      unawaited(refreshHealth());
    } else {
      emit(state.copyWith(isBusy: false, failure: result.requireFailure));
    }
  }

  Future<void> sendTest() async {
    if (state.isBusy) return;

    emit(state.copyWith(isBusy: true, failure: null, testResult: null));
    final Result<TestPushResultModel> result = await _repo.sendTest(
      _env.defaultQuote,
    );
    if (isClosed) return;

    if (result.isSuccess) {
      emit(
        state.copyWith(
          isBusy: false,
          testResult: result.requireValue,
          failure: null,
        ),
      );
    } else {
      emit(state.copyWith(isBusy: false, failure: result.requireFailure));
    }
  }

  void _onTokenRefresh(String token) {
    if (state.device == null || state.isBusy) return;
    unawaited(_reregisterToken(token));
  }

  Future<void> _reregisterToken(String token) async {
    final Result<DeviceModel> result = await _repo.registerDevice(
      token: token,
      platform: 'android',
      quote: _env.defaultQuote,
    );
    if (isClosed) return;

    if (result.isSuccess) {
      emit(state.copyWith(device: result.requireValue, failure: null));
    } else {
      emit(state.copyWith(failure: result.requireFailure));
    }
  }


  @override
  Future<void> close() async {
    await _tokenSubscription.cancel();
    return super.close();
  }
}
