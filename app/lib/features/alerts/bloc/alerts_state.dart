import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/view_status.dart';
import '../data/models/alert_models.dart';

part 'alerts_state.freezed.dart';

enum AlertSubmitStatus { idle, submitting, success, failure }

@freezed
abstract class AlertsState with _$AlertsState {
  const factory AlertsState({
    @Default(ViewStatus.initial) ViewStatus status,
    @Default(<int>[]) List<int> ids,
    @Default(<int, AlertRuleModel>{}) Map<int, AlertRuleModel> byId,
    @Default(<String>[]) List<String> quotes,
    Failure? failure,
    @Default(AlertSubmitStatus.idle) AlertSubmitStatus submitStatus,
    int? busyId,
  }) = _AlertsState;

  const AlertsState._();

  bool get hasItems => ids.isNotEmpty;
}
