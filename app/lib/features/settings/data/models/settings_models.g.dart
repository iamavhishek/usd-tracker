// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthDatabaseModel _$HealthDatabaseModelFromJson(Map<String, dynamic> json) =>
    _HealthDatabaseModel(ok: json['ok'] as bool? ?? false);

Map<String, dynamic> _$HealthDatabaseModelToJson(
  _HealthDatabaseModel instance,
) => <String, dynamic>{'ok': instance.ok};

_HealthFcmModel _$HealthFcmModelFromJson(Map<String, dynamic> json) =>
    _HealthFcmModel(
      configured: json['configured'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$HealthFcmModelToJson(_HealthFcmModel instance) =>
    <String, dynamic>{
      'configured': instance.configured,
      'error': instance.error,
    };

_HealthDevicesModel _$HealthDevicesModelFromJson(Map<String, dynamic> json) =>
    _HealthDevicesModel(active: (json['active'] as num?)?.toInt() ?? 0);

Map<String, dynamic> _$HealthDevicesModelToJson(_HealthDevicesModel instance) =>
    <String, dynamic>{'active': instance.active};

_HealthLastPollModel _$HealthLastPollModelFromJson(Map<String, dynamic> json) =>
    _HealthLastPollModel(
      status: json['status'] as String?,
      at: json['at'] as String?,
      finishedAt: json['finishedAt'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$HealthLastPollModelToJson(
  _HealthLastPollModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'at': instance.at,
  'finishedAt': instance.finishedAt,
  'error': instance.error,
};

_HealthRateModel _$HealthRateModelFromJson(
  Map<String, dynamic> json,
) => _HealthRateModel(
  baseCurrency: json['baseCurrency'] as String? ?? 'USD',
  quotes:
      (json['quotes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  pollCron: json['pollCron'] as String? ?? '* * * * *',
  lastPoll: json['lastPoll'] == null
      ? null
      : HealthLastPollModel.fromJson(json['lastPoll'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HealthRateModelToJson(_HealthRateModel instance) =>
    <String, dynamic>{
      'baseCurrency': instance.baseCurrency,
      'quotes': instance.quotes,
      'pollCron': instance.pollCron,
      'lastPoll': instance.lastPoll,
    };

_HealthModel _$HealthModelFromJson(Map<String, dynamic> json) => _HealthModel(
  status: json['status'] as String,
  database: HealthDatabaseModel.fromJson(
    json['database'] as Map<String, dynamic>,
  ),
  fcm: HealthFcmModel.fromJson(json['fcm'] as Map<String, dynamic>),
  devices: HealthDevicesModel.fromJson(json['devices'] as Map<String, dynamic>),
  rate: HealthRateModel.fromJson(json['rate'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HealthModelToJson(_HealthModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'database': instance.database,
      'fcm': instance.fcm,
      'devices': instance.devices,
      'rate': instance.rate,
    };

_DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => _DeviceModel(
  id: (json['id'] as num).toInt(),
  platform: json['platform'] as String,
  quote: json['quote'] as String,
  enabled: json['enabled'] as bool,
  tokenPreview: json['tokenPreview'] as String,
  registeredAt: json['registeredAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$DeviceModelToJson(_DeviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'platform': instance.platform,
      'quote': instance.quote,
      'enabled': instance.enabled,
      'tokenPreview': instance.tokenPreview,
      'registeredAt': instance.registeredAt,
      'updatedAt': instance.updatedAt,
    };

_TestPushResultModel _$TestPushResultModelFromJson(Map<String, dynamic> json) =>
    _TestPushResultModel(
      requested: (json['requested'] as num?)?.toInt() ?? 0,
      deviceCount: (json['deviceCount'] as num?)?.toInt() ?? 0,
      successCount: (json['successCount'] as num?)?.toInt() ?? 0,
      failureCount: (json['failureCount'] as num?)?.toInt() ?? 0,
      skipped: json['skipped'] as bool? ?? false,
      skippedReason: json['skippedReason'] as String?,
    );

Map<String, dynamic> _$TestPushResultModelToJson(
  _TestPushResultModel instance,
) => <String, dynamic>{
  'requested': instance.requested,
  'deviceCount': instance.deviceCount,
  'successCount': instance.successCount,
  'failureCount': instance.failureCount,
  'skipped': instance.skipped,
  'skippedReason': instance.skippedReason,
};
