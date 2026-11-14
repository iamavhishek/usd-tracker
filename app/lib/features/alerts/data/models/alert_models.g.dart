// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertRuleModel _$AlertRuleModelFromJson(Map<String, dynamic> json) =>
    _AlertRuleModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      base: json['base'] as String,
      quote: json['quote'] as String,
      condition: $enumDecode(_$AlertConditionEnumMap, json['condition']),
      threshold: (json['threshold'] as num).toDouble(),
      enabled: json['enabled'] as bool,
      cooldownSeconds: (json['cooldownSeconds'] as num).toInt(),
      lastTriggeredAt: json['lastTriggeredAt'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$AlertRuleModelToJson(_AlertRuleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base': instance.base,
      'quote': instance.quote,
      'condition': _$AlertConditionEnumMap[instance.condition]!,
      'threshold': instance.threshold,
      'enabled': instance.enabled,
      'cooldownSeconds': instance.cooldownSeconds,
      'lastTriggeredAt': instance.lastTriggeredAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

const _$AlertConditionEnumMap = {
  AlertCondition.above: 'above',
  AlertCondition.below: 'below',
};
