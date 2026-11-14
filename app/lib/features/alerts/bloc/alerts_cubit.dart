import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_env.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/models/view_status.dart';
import '../../rates/repo/rates_repo.dart';
import '../data/models/alert_models.dart';
import '../repo/alerts_repo.dart';
import 'alerts_state.dart';

class AlertsCubit extends Cubit<AlertsState> {
  AlertsCubit(this._repo, this._ratesRepo, AppEnv env)
    : _fallbackQuote = env.defaultQuote,
      super(const AlertsState());

  final AlertsRepo _repo;
  final RatesRepo _ratesRepo;
  final String _fallbackQuote;

  Future<void> load() => _fetch();

  Future<void> refresh() => _fetch();

  Future<void> toggle(int id) async {
    if (state.busyId != null) return;

    final AlertRuleModel? rule = state.byId[id];
    if (rule == null) return;

    emit(state.copyWith(busyId: id, failure: null));
    final Result<AlertRuleModel> result = await _repo.setEnabled(
      id,
      !rule.enabled,
    );
    if (isClosed) return;

    if (result.isSuccess) {
      final AlertRuleModel updated = result.requireValue;
      emit(
        state.copyWith(
          busyId: null,
          byId: <int, AlertRuleModel>{...state.byId, id: updated},
          failure: null,
        ),
      );
    } else {
      emit(state.copyWith(busyId: null, failure: result.requireFailure));
    }
  }

  Future<void> delete(int id) async {
    if (state.busyId != null) return;

    emit(state.copyWith(busyId: id, failure: null));
    final Result<void> result = await _repo.delete(id);
    if (isClosed) return;

    if (result.isSuccess) {
      emit(
        state.copyWith(
          busyId: null,
          ids: state.ids.where((int item) => item != id).toList(),
          byId: <int, AlertRuleModel>{
            for (final MapEntry<int, AlertRuleModel> entry
                in state.byId.entries)
              if (entry.key != id) entry.key: entry.value,
          },
          failure: null,
        ),
      );
    } else {
      emit(state.copyWith(busyId: null, failure: result.requireFailure));
    }
  }

  Future<void> create({
    required String quote,
    required AlertCondition condition,
    required double threshold,
    String? name,
  }) async {
    if (state.submitStatus == AlertSubmitStatus.submitting) return;

    emit(
      state.copyWith(submitStatus: AlertSubmitStatus.submitting, failure: null),
    );

    final Result<AlertRuleModel> result = await _repo.create(
      quote: quote,
      condition: condition,
      threshold: threshold,
      name: name,
    );
    if (isClosed) return;

    if (result.isSuccess) {
      final AlertRuleModel value = result.requireValue;
      emit(
        state.copyWith(
          submitStatus: AlertSubmitStatus.success,
          ids: <int>[value.id, ...state.ids.where((int id) => id != value.id)],
          byId: <int, AlertRuleModel>{...state.byId, value.id: value},
          failure: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          submitStatus: AlertSubmitStatus.failure,
          failure: result.requireFailure,
        ),
      );
    }
  }

  void resetSubmitStatus() {
    if (state.submitStatus != AlertSubmitStatus.idle) {
      emit(state.copyWith(submitStatus: AlertSubmitStatus.idle));
    }
  }

  Future<void> _fetch() async {
    final bool hasItems = state.hasItems;
    emit(
      state.copyWith(
        status: hasItems ? ViewStatus.refreshing : ViewStatus.loading,
        failure: null,
      ),
    );

    final Result<List<AlertRuleModel>> alertsResult = await _repo.fetchAll();
    if (isClosed) return;

    final List<AlertRuleModel> rules = alertsResult.isSuccess
        ? alertsResult.requireValue
        : state.byId.values.toList(growable: false);

    final Result<List<String>> quotesResult = await _ratesRepo.trackedQuotes();
    if (isClosed) return;

    final List<String> quotes = quotesResult.isSuccess
        ? quotesResult.requireValue
        : state.quotes.isEmpty
        ? <String>[_fallbackQuote]
        : state.quotes;

    final Failure? failure = alertsResult.isFailure
        ? alertsResult.requireFailure
        : null;

    emit(
      state.copyWith(
        status: rules.isEmpty && failure != null
            ? ViewStatus.failure
            : ViewStatus.success,
        ids: rules.map((AlertRuleModel rule) => rule.id).toList(),
        byId: <int, AlertRuleModel>{
          for (final AlertRuleModel rule in rules) rule.id: rule,
        },
        quotes: quotes,
        failure: failure,
      ),
    );
  }
}
