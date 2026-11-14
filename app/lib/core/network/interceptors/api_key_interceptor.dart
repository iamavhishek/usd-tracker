import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  const ApiKeyInterceptor(this._apiKey);

  final String _apiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_apiKey.isNotEmpty) {
      options.headers['X-API-Key'] = _apiKey;
    }
    handler.next(options);
  }
}
