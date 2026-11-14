import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usd_tracker/core/errors/failure.dart';
import 'package:usd_tracker/core/errors/result.dart';
import 'package:usd_tracker/core/errors/run_catching.dart';

void main() {
  final RequestOptions options = RequestOptions(path: '/rates');

  DioException badResponse(int status, Object? data) {
    return DioException(
      requestOptions: options,
      type: DioExceptionType.badResponse,
      response: Response<Object?>(
        requestOptions: options,
        statusCode: status,
        data: data,
      ),
    );
  }

  Failure? failureOf(Result<Object?> result) {
    return result.isFailure ? result.requireFailure : null;
  }

  test('maps unauthorized responses', () async {
    final Result<Object?> result = await runCatchingExceptions<Object?>(
      () async => throw badResponse(401, null),
    );

    expect(failureOf(result)?.kind, FailureKind.unauthorized);
  });

  test('maps not-found responses', () async {
    final Result<Object?> result = await runCatchingExceptions<Object?>(
      () async => throw badResponse(404, null),
    );

    expect(failureOf(result)?.kind, FailureKind.notFound);
  });

  test('keeps the Nest error message for server failures', () async {
    final Result<Object?> result = await runCatchingExceptions<Object?>(
      () async => throw badResponse(400, <String, Object?>{
        'statusCode': 400,
        'message': 'quote must be a three-letter ISO-4217 currency code',
        'error': 'Bad Request',
      }),
    );

    final Failure? failure = failureOf(result);
    expect(failure?.kind, FailureKind.server);
    expect(
      failure?.message,
      'quote must be a three-letter ISO-4217 currency code',
    );
    expect(failure?.statusCode, 400);
  });

  test('maps connection errors to network failures', () async {
    final Result<Object?> result = await runCatchingExceptions<Object?>(
      () async => throw DioException(
        requestOptions: options,
        type: DioExceptionType.connectionError,
      ),
    );

    expect(failureOf(result)?.kind, FailureKind.network);
  });

  test('maps timeouts', () async {
    final Result<Object?> result = await runCatchingExceptions<Object?>(
      () async => throw DioException(
        requestOptions: options,
        type: DioExceptionType.receiveTimeout,
      ),
    );

    expect(failureOf(result)?.kind, FailureKind.timeout);
  });

  test('maps unexpected exceptions to unknown failures', () async {
    final Result<Object?> result = await runCatchingExceptions<Object?>(
      () async => throw StateError('boom'),
    );

    expect(failureOf(result)?.kind, FailureKind.unknown);
  });
}
