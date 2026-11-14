import 'package:freezed_annotation/freezed_annotation.dart';

part 'rates_models.freezed.dart';
part 'rates_models.g.dart';

enum RateDirection { up, down, flat }

@freezed
abstract class RateModel with _$RateModel {
  const factory RateModel({
    required String base,
    required String quote,
    double? rate,
    String? rateDate,
    String? fetchedAt,
    String? provider,
    double? previousRate,
    double? change,
    double? changePercent,
    RateDirection? direction,
  }) = _RateModel;

  factory RateModel.fromJson(Map<String, dynamic> json) =>
      _$RateModelFromJson(json);
}

@freezed
abstract class PollSummaryModel with _$PollSummaryModel {
  const factory PollSummaryModel({
    String? status,
    String? trigger,
    String? at,
    String? finishedAt,
    int? durationMs,
  }) = _PollSummaryModel;

  factory PollSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$PollSummaryModelFromJson(json);
}

@freezed
abstract class RateOverviewModel with _$RateOverviewModel {
  const factory RateOverviewModel({
    required String base,
    @Default(<RateModel>[]) List<RateModel> rates,
    PollSummaryModel? lastPoll,
  }) = _RateOverviewModel;

  factory RateOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$RateOverviewModelFromJson(json);
}

@freezed
abstract class HistoryPointModel with _$HistoryPointModel {
  const factory HistoryPointModel({
    required double rate,
    required String rateDate,
    required String fetchedAt,
  }) = _HistoryPointModel;

  factory HistoryPointModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryPointModelFromJson(json);
}

@freezed
abstract class RateHistoryModel with _$RateHistoryModel {
  const factory RateHistoryModel({
    required String base,
    required String quote,
    @Default(<HistoryPointModel>[]) List<HistoryPointModel> points,
  }) = _RateHistoryModel;

  factory RateHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$RateHistoryModelFromJson(json);
}

/// What the dashboard needs in one value: the current rate and its history,
/// plus whether it came from the offline cache.
@freezed
abstract class RatesBundle with _$RatesBundle {
  const factory RatesBundle({
    required RateModel rate,
    @Default(<HistoryPointModel>[]) List<HistoryPointModel> history,
    @Default(false) bool isStale,
  }) = _RatesBundle;
}
