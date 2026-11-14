import 'package:dio/dio.dart';

import '../models/rates_models.dart';

abstract class RatesRemoteDataSource {
  Future<RateOverviewModel> fetchOverview();

  Future<RateHistoryModel> fetchHistory(String quote, {int limit = 60});

  Future<void> backfill(String quote, {int days = 7});
}

class RatesRemoteDataSourceImpl implements RatesRemoteDataSource {
  RatesRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<RateOverviewModel> fetchOverview() async {
    final Response<Map<String, dynamic>> response = await _dio
        .get<Map<String, dynamic>>('/rates');
    final Map<String, dynamic>? body = response.data;
    if (body == null) throw const FormatException('Empty rate response');
    return RateOverviewModel.fromJson(body);
  }

  @override
  Future<RateHistoryModel> fetchHistory(String quote, {int limit = 60}) async {
    final Response<Map<String, dynamic>> response = await _dio
        .get<Map<String, dynamic>>(
          '/rates/${quote.toUpperCase()}/history',
          queryParameters: <String, Object?>{'limit': limit},
        );
    final Map<String, dynamic>? body = response.data;
    if (body == null) throw const FormatException('Empty history response');
    return RateHistoryModel.fromJson(body);
  }

  @override
  Future<void> backfill(String quote, {int days = 7}) async {
    await _dio.post<void>(
      '/rates/${quote.toUpperCase()}/backfill',
      queryParameters: <String, Object?>{'days': days},
    );
  }
}
