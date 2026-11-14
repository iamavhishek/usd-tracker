import 'package:dio/dio.dart';

import '../models/alert_models.dart';

abstract class AlertsRemoteDataSource {
  Future<List<AlertRuleModel>> fetchAll();

  Future<AlertRuleModel> create({
    required String quote,
    required AlertCondition condition,
    required double threshold,
    String? name,
  });

  Future<AlertRuleModel> setEnabled(int id, bool enabled);

  Future<void> delete(int id);
}

class AlertsRemoteDataSourceImpl implements AlertsRemoteDataSource {
  AlertsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<AlertRuleModel>> fetchAll() async {
    final Response<List<Object?>> response = await _dio.get<List<Object?>>(
      '/alerts',
    );
    final List<Object?>? data = response.data;

    return <AlertRuleModel>[
      for (final Object? entry in data ?? <Object?>[])
        if (entry is Map<String, dynamic>) AlertRuleModel.fromJson(entry),
    ];
  }

  @override
  Future<AlertRuleModel> create({
    required String quote,
    required AlertCondition condition,
    required double threshold,
    String? name,
  }) async {
    final Response<Map<String, dynamic>> response = await _dio
        .post<Map<String, dynamic>>(
          '/alerts',
          data: <String, Object?>{
            'quote': quote.toUpperCase(),
            'condition': condition.name,
            'threshold': threshold,
            if (name != null && name.trim().isNotEmpty) 'name': name.trim(),
          },
        );
    final Map<String, dynamic>? body = response.data;
    if (body == null) throw const FormatException('Empty alert response');
    return AlertRuleModel.fromJson(body);
  }

  @override
  Future<AlertRuleModel> setEnabled(int id, bool enabled) async {
    final Response<Map<String, dynamic>> response = await _dio
        .patch<Map<String, dynamic>>(
          '/alerts/$id',
          data: <String, Object?>{'enabled': enabled},
        );
    final Map<String, dynamic>? body = response.data;
    if (body == null) throw const FormatException('Empty alert response');
    return AlertRuleModel.fromJson(body);
  }

  @override
  Future<void> delete(int id) async {
    await _dio.delete<void>('/alerts/$id');
  }
}
