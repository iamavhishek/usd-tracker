// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RateModel _$RateModelFromJson(Map<String, dynamic> json) => _RateModel(
  base: json['base'] as String,
  quote: json['quote'] as String,
  rate: (json['rate'] as num?)?.toDouble(),
  rateDate: json['rateDate'] as String?,
  fetchedAt: json['fetchedAt'] as String?,
  provider: json['provider'] as String?,
  previousRate: (json['previousRate'] as num?)?.toDouble(),
  change: (json['change'] as num?)?.toDouble(),
  changePercent: (json['changePercent'] as num?)?.toDouble(),
  direction: $enumDecodeNullable(_$RateDirectionEnumMap, json['direction']),
);

Map<String, dynamic> _$RateModelToJson(_RateModel instance) =>
    <String, dynamic>{
      'base': instance.base,
      'quote': instance.quote,
      'rate': instance.rate,
      'rateDate': instance.rateDate,
      'fetchedAt': instance.fetchedAt,
      'provider': instance.provider,
      'previousRate': instance.previousRate,
      'change': instance.change,
      'changePercent': instance.changePercent,
      'direction': _$RateDirectionEnumMap[instance.direction],
    };

const _$RateDirectionEnumMap = {
  RateDirection.up: 'up',
  RateDirection.down: 'down',
  RateDirection.flat: 'flat',
};

_PollSummaryModel _$PollSummaryModelFromJson(Map<String, dynamic> json) =>
    _PollSummaryModel(
      status: json['status'] as String?,
      trigger: json['trigger'] as String?,
      at: json['at'] as String?,
      finishedAt: json['finishedAt'] as String?,
      durationMs: (json['durationMs'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PollSummaryModelToJson(_PollSummaryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'trigger': instance.trigger,
      'at': instance.at,
      'finishedAt': instance.finishedAt,
      'durationMs': instance.durationMs,
    };

_RateOverviewModel _$RateOverviewModelFromJson(Map<String, dynamic> json) =>
    _RateOverviewModel(
      base: json['base'] as String,
      rates:
          (json['rates'] as List<dynamic>?)
              ?.map((e) => RateModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RateModel>[],
      lastPoll: json['lastPoll'] == null
          ? null
          : PollSummaryModel.fromJson(json['lastPoll'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateOverviewModelToJson(_RateOverviewModel instance) =>
    <String, dynamic>{
      'base': instance.base,
      'rates': instance.rates,
      'lastPoll': instance.lastPoll,
    };

_HistoryPointModel _$HistoryPointModelFromJson(Map<String, dynamic> json) =>
    _HistoryPointModel(
      rate: (json['rate'] as num).toDouble(),
      rateDate: json['rateDate'] as String,
      fetchedAt: json['fetchedAt'] as String,
    );

Map<String, dynamic> _$HistoryPointModelToJson(_HistoryPointModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'rateDate': instance.rateDate,
      'fetchedAt': instance.fetchedAt,
    };

_RateHistoryModel _$RateHistoryModelFromJson(Map<String, dynamic> json) =>
    _RateHistoryModel(
      base: json['base'] as String,
      quote: json['quote'] as String,
      points:
          (json['points'] as List<dynamic>?)
              ?.map(
                (e) => HistoryPointModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <HistoryPointModel>[],
    );

Map<String, dynamic> _$RateHistoryModelToJson(_RateHistoryModel instance) =>
    <String, dynamic>{
      'base': instance.base,
      'quote': instance.quote,
      'points': instance.points,
    };
