import 'dart:async';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/errors/run_catching.dart';
import '../data/datasources/rates_local_datasource.dart';
import '../data/datasources/rates_remote_datasource.dart';
import '../data/models/rates_models.dart';
import 'rates_repo.dart';

class RatesRepoImpl implements RatesRepo {
  RatesRepoImpl(this._remote, this._local);

  final RatesRemoteDataSource _remote;
  final RatesLocalDataSource _local;

  @override
  Future<Result<RatesBundle>> load({required String quote}) async {
    final Result<RateOverviewModel> overviewResult =
        await runCatchingExceptions(_remote.fetchOverview);

    if (overviewResult.isSuccess) {
      final RateOverviewModel overview = overviewResult.requireValue;
      final RateModel? rate = _findRate(overview.rates, quote);
      if (rate == null || rate.rate == null) {
        return const Result<RatesBundle>.failure(Failure.notFound());
      }

      final Result<RateHistoryModel> historyResult =
          await runCatchingExceptions(() => _remote.fetchHistory(rate.quote));

      final List<HistoryPointModel> history;
      if (historyResult.isSuccess) {
        final RateHistoryModel model = historyResult.requireValue;
        unawaited(_local.writeHistory(model));
        history = model.points;
      } else {
        history =
            _local.readHistory(rate.quote)?.points ??
            const <HistoryPointModel>[];
      }

      unawaited(_local.writeOverview(overview));

      return Result<RatesBundle>.success(
        RatesBundle(rate: rate, history: history),
      );
    }

    final Failure failure = overviewResult.requireFailure;
    final RateOverviewModel? cached = _local.readOverview();
    final RateModel? cachedRate = cached == null
        ? null
        : _findRate(cached.rates, quote);

    if (cachedRate == null) {
      return Result<RatesBundle>.failure(failure);
    }

    return Result<RatesBundle>.success(
      RatesBundle(
        rate: cachedRate,
        history:
            _local.readHistory(cachedRate.quote)?.points ??
            const <HistoryPointModel>[],
        isStale: true,
      ),
    );
  }

  @override
  Future<Result<void>> backfill({required String quote, int days = 7}) {
    return runCatchingExceptions<void>(() async {
      await _remote.backfill(quote, days: days);
    });
  }

  @override
  Future<Result<List<String>>> trackedQuotes() async {
    final Result<RateOverviewModel> result = await runCatchingExceptions(
      _remote.fetchOverview,
    );

    if (result.isSuccess) {
      return Result<List<String>>.success(_quotes(result.requireValue));
    }

    final Failure failure = result.requireFailure;
    final RateOverviewModel? cached = _local.readOverview();
    if (cached == null) return Result<List<String>>.failure(failure);

    return Result<List<String>>.success(_quotes(cached));
  }

  List<String> _quotes(RateOverviewModel overview) {
    return overview.rates
        .map((RateModel rate) => rate.quote)
        .toSet()
        .toList(growable: false);
  }

  RateModel? _findRate(List<RateModel> rates, String quote) {
    final String wanted = quote.toUpperCase();

    for (final RateModel rate in rates) {
      if (rate.quote.toUpperCase() == wanted) return rate;
    }
    return rates.isEmpty ? null : rates.first;
  }
}
