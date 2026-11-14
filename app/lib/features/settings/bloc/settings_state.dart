import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/view_status.dart';
import '../../../../core/services/push_status.dart';
import '../data/models/settings_models.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(ViewStatus.initial) ViewStatus status,
    HealthModel? health,
    @Default(PushStatus()) PushStatus push,
    DeviceModel? device,
    @Default(false) bool isBusy,
    Failure? failure,
    TestPushResultModel? testResult,
    @Default('') String baseUrl,
    @Default(false) bool hasApiKey,
    @Default('NPR') String quote,
  }) = _SettingsState;

  const SettingsState._();
}
