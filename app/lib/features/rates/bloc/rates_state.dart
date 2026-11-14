import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/view_status.dart';
import '../data/models/rates_models.dart';

part 'rates_state.freezed.dart';

@freezed
abstract class RatesState with _$RatesState {
  const factory RatesState({
    @Default(ViewStatus.initial) ViewStatus status,
    RateModel? rate,
    @Default(<HistoryPointModel>[]) List<HistoryPointModel> history,
    @Default(false) bool isStale,
    @Default(false) bool isBackfilling,
    Failure? failure,
  }) = _RatesState;

  const RatesState._();

  bool get hasRate => rate?.rate != null;
}
