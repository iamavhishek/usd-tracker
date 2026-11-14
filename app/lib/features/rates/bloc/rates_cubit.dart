import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_env.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/models/view_status.dart';
import '../data/models/rates_models.dart';
import '../repo/rates_repo.dart';
import 'rates_state.dart';

class RatesCubit extends Cubit<RatesState> {
  RatesCubit(this._repo, AppEnv env)
    : _quote = env.defaultQuote,
      super(const RatesState());

  final RatesRepo _repo;
  final String _quote;

  Future<void> load() => _fetch();

  Future<void> refresh() => _fetch();

  Future<void> backfill() async {
    if (state.isBackfilling) return;

    emit(state.copyWith(isBackfilling: true, failure: null));
    final Result<void> result = await _repo.backfill(quote: _quote);
    if (isClosed) return;

    if (result.isSuccess) {
      emit(state.copyWith(isBackfilling: false));
      await _fetch();
    } else {
      emit(
        state.copyWith(isBackfilling: false, failure: result.requireFailure),
      );
    }
  }

  Future<void> _fetch() async {
    if (state.status == ViewStatus.loading ||
        state.status == ViewStatus.refreshing) {
      return;
    }

    final bool hasData = state.hasRate;
    emit(
      state.copyWith(
        status: hasData ? ViewStatus.refreshing : ViewStatus.loading,
        failure: null,
      ),
    );

    final Result<RatesBundle> result = await _repo.load(quote: _quote);
    if (isClosed) return;

    if (result.isSuccess) {
      final RatesBundle bundle = result.requireValue;
      emit(
        state.copyWith(
          status: ViewStatus.success,
          rate: bundle.rate,
          history: bundle.history,
          isStale: bundle.isStale,
          failure: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: hasData ? ViewStatus.success : ViewStatus.failure,
          failure: result.requireFailure,
        ),
      );
    }
  }
}
