import 'package:dio/dio.dart';

import '../models/settings_models.dart';

abstract class SettingsRemoteDataSource {
  Future<HealthModel> fetchHealth();

  Future<DeviceModel> registerDevice({
    required String token,
    required String platform,
    required String quote,
  });

  Future<void> unregisterDevice(String token);

  Future<TestPushResultModel> sendTest(String quote);
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  SettingsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<HealthModel> fetchHealth() async {
    final Response<Map<String, dynamic>> response = await _dio
        .get<Map<String, dynamic>>('/health');
    final Map<String, dynamic>? body = response.data;
    if (body == null) throw const FormatException('Empty health response');
    return HealthModel.fromJson(body);
  }

  @override
  Future<DeviceModel> registerDevice({
    required String token,
    required String platform,
    required String quote,
  }) async {
    final Response<Map<String, dynamic>> response = await _dio
        .post<Map<String, dynamic>>(
          '/devices',
          data: <String, Object?>{
            'token': token,
            'platform': platform,
            'quote': quote.toUpperCase(),
          },
        );
    final Map<String, dynamic>? body = response.data;
    if (body == null) throw const FormatException('Empty device response');
    return DeviceModel.fromJson(body);
  }

  @override
  Future<void> unregisterDevice(String token) async {
    await _dio.delete<void>('/devices/${Uri.encodeComponent(token)}');
  }

  @override
  Future<TestPushResultModel> sendTest(String quote) async {
    final Response<Map<String, dynamic>> response = await _dio
        .post<Map<String, dynamic>>(
          '/notifications/test',
          data: <String, Object?>{'quote': quote.toUpperCase()},
        );
    final Map<String, dynamic>? body = response.data;
    if (body == null) throw const FormatException('Empty push response');
    return TestPushResultModel.fromJson(body);
  }
}
