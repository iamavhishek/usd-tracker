import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_models.freezed.dart';
part 'alert_models.g.dart';

enum AlertCondition { above, below }

@freezed
abstract class AlertRuleModel with _$AlertRuleModel {
  const factory AlertRuleModel({
    required int id,
    String? name,
    required String base,
    required String quote,
    required AlertCondition condition,
    required double threshold,
    required bool enabled,
    required int cooldownSeconds,
    String? lastTriggeredAt,
    required String createdAt,
    required String updatedAt,
  }) = _AlertRuleModel;

  factory AlertRuleModel.fromJson(Map<String, dynamic> json) =>
      _$AlertRuleModelFromJson(json);
}
