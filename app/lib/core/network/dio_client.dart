import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'interceptors/api_key_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

/// One shared Dio instance for the whole app.
class DioClient {
  DioClient({required String baseUrl, required String apiKey})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 15),
          headers: const <String, String>{'Accept': 'application/json'},
          responseType: ResponseType.json,
        ),
      ) {
    dio.interceptors.add(ApiKeyInterceptor(apiKey));
    if (kDebugMode) {
      dio.interceptors.add(const AppLoggingInterceptor());
    }
  }

  final Dio dio;
}
