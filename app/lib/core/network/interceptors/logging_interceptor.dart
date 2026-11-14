import 'package:dio/dio.dart';

import '../../utils/app_logger.dart';

/// Debug-only request/response log. Never logs headers (the API key lives
/// there).
class AppLoggingInterceptor extends Interceptor {
  const AppLoggingInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.d('→ ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<Object?> response,
    ResponseInterceptorHandler handler,
  ) {
    AppLogger.d('← ${response.statusCode} ${response.requestOptions.uri.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.d(
      '✕ ${err.requestOptions.method} ${err.requestOptions.uri.path} '
      '(${err.type.name})',
    );
    handler.next(err);
  }
}
