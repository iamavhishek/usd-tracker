import 'dart:convert';

import 'package:hive_ce/hive.dart';

import '../../../../core/storage/cache_keys.dart';
import '../models/rates_models.dart';

abstract class RatesLocalDataSource {
  RateOverviewModel? readOverview();

  RateHistoryModel? readHistory(String quote);

  Future<void> writeOverview(RateOverviewModel overview);

  Future<void> writeHistory(RateHistoryModel history);
}

class RatesLocalDataSourceImpl implements RatesLocalDataSource {
  RatesLocalDataSourceImpl(this._box);

  final Box<String> _box;

  @override
  RateOverviewModel? readOverview() {
    final String? raw = _box.get(CacheKeys.overview);
    if (raw == null) return null;

    try {
      final Object? decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      return RateOverviewModel.fromJson(decoded);
    } on FormatException {
      return null;
    }
  }

  @override
  RateHistoryModel? readHistory(String quote) {
    final String? raw = _box.get(CacheKeys.history(quote));
    if (raw == null) return null;

    try {
      final Object? decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      return RateHistoryModel.fromJson(decoded);
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> writeOverview(RateOverviewModel overview) {
    return _box.put(CacheKeys.overview, jsonEncode(overview.toJson()));
  }

  @override
  Future<void> writeHistory(RateHistoryModel history) {
    return _box.put(
      CacheKeys.history(history.quote),
      jsonEncode(history.toJson()),
    );
  }
}
