import 'package:dio/dio.dart';

import 'failure.dart';
import 'result.dart';

/// The only place exceptions become failures. Repos call this and never throw.
Future<Result<T>> runCatchingExceptions<T>(Future<T> Function() body) async {
  try {
    return Result<T>.success(await body());
  } on DioException catch (error) {
    return Result<T>.failure(_fromDio(error));
  } catch (error) {
    return Result<T>.failure(Failure.unknown(message: error.toString()));
  }
}

Failure _fromDio(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const Failure.timeout();
    case DioExceptionType.cancel:
      return const Failure.cancelled();
    case DioExceptionType.badCertificate:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      return Failure.network(message: error.message);
    case DioExceptionType.badResponse:
      final int? status = error.response?.statusCode;
      final String? message = _extractMessage(error.response?.data);
      return switch (status) {
        401 => const Failure.unauthorized(),
        403 => const Failure.forbidden(),
        404 => const Failure.notFound(),
        422 => Failure.validation(_fieldErrors(error.response?.data)),
        _ => Failure.server(statusCode: status, message: message),
      };
  }
}

/// Nest's default error envelope: `{ statusCode, message, error }`.
String? _extractMessage(Object? data) {
  if (data is! Map<String, Object?>) return null;
  final Object? message = data['message'];

  if (message is String) return message;
  if (message is List<Object?>) {
    return message.map((Object? entry) => '$entry').join('\n');
  }
  return null;
}

Map<String, List<String>> _fieldErrors(Object? data) {
  if (data is! Map<String, Object?>) return const <String, List<String>>{};
  final Object? errors = data['errors'];
  if (errors is! Map<String, Object?>) return const <String, List<String>>{};

  return <String, List<String>>{
    for (final MapEntry<String, Object?> entry in errors.entries)
      entry.key: switch (entry.value) {
        final List<Object?> list =>
          list.map((Object? item) => '$item').toList(),
        final Object? other => <String>['${other ?? ''}'],
      },
  };
}
