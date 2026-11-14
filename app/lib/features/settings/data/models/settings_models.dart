import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_models.freezed.dart';
part 'settings_models.g.dart';

@freezed
abstract class HealthDatabaseModel with _$HealthDatabaseModel {
  const factory HealthDatabaseModel({@Default(false) bool ok}) =
      _HealthDatabaseModel;

  factory HealthDatabaseModel.fromJson(Map<String, dynamic> json) =>
      _$HealthDatabaseModelFromJson(json);
}

@freezed
abstract class HealthFcmModel with _$HealthFcmModel {
  const factory HealthFcmModel({
    @Default(false) bool configured,
    String? error,
  }) = _HealthFcmModel;

  factory HealthFcmModel.fromJson(Map<String, dynamic> json) =>
      _$HealthFcmModelFromJson(json);
}

@freezed
abstract class HealthDevicesModel with _$HealthDevicesModel {
  const factory HealthDevicesModel({@Default(0) int active}) =
      _HealthDevicesModel;

  factory HealthDevicesModel.fromJson(Map<String, dynamic> json) =>
      _$HealthDevicesModelFromJson(json);
}

@freezed
abstract class HealthLastPollModel with _$HealthLastPollModel {
  const factory HealthLastPollModel({
    String? status,
    String? at,
    String? finishedAt,
    String? error,
  }) = _HealthLastPollModel;

  factory HealthLastPollModel.fromJson(Map<String, dynamic> json) =>
      _$HealthLastPollModelFromJson(json);
}

@freezed
abstract class HealthRateModel with _$HealthRateModel {
  const factory HealthRateModel({
    @Default('USD') String baseCurrency,
    @Default(<String>[]) List<String> quotes,
    @Default('* * * * *') String pollCron,
    HealthLastPollModel? lastPoll,
  }) = _HealthRateModel;

  factory HealthRateModel.fromJson(Map<String, dynamic> json) =>
      _$HealthRateModelFromJson(json);
}

@freezed
abstract class HealthModel with _$HealthModel {
  const factory HealthModel({
    required String status,
    required HealthDatabaseModel database,
    required HealthFcmModel fcm,
    required HealthDevicesModel devices,
    required HealthRateModel rate,
  }) = _HealthModel;

  factory HealthModel.fromJson(Map<String, dynamic> json) =>
      _$HealthModelFromJson(json);
}

@freezed
abstract class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    required int id,
    required String platform,
    required String quote,
    required bool enabled,
    required String tokenPreview,
    required String registeredAt,
    required String updatedAt,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
}

@freezed
abstract class TestPushResultModel with _$TestPushResultModel {
  const factory TestPushResultModel({
    @Default(0) int requested,
    @Default(0) int deviceCount,
    @Default(0) int successCount,
    @Default(0) int failureCount,
    @Default(false) bool skipped,
    String? skippedReason,
  }) = _TestPushResultModel;

  factory TestPushResultModel.fromJson(Map<String, dynamic> json) =>
      _$TestPushResultModelFromJson(json);
}
