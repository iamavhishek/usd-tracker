import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:usd_tracker/core/config/app_env.dart';
import 'package:usd_tracker/core/errors/failure.dart';
import 'package:usd_tracker/core/errors/result.dart';
import 'package:usd_tracker/features/alerts/bloc/alerts_cubit.dart';
import 'package:usd_tracker/features/alerts/bloc/alerts_state.dart';
import 'package:usd_tracker/features/alerts/data/models/alert_models.dart';
import 'package:usd_tracker/features/alerts/repo/alerts_repo.dart';
import 'package:usd_tracker/features/rates/repo/rates_repo.dart';

class MockAlertsRepo extends Mock implements AlertsRepo {}

class MockRatesRepo extends Mock implements RatesRepo {}

const AppEnv env = AppEnv(
  flavor: AppFlavor.dev,
  baseUrl: 'http://127.0.0.1:3000/api/v1',
  apiKey: 'test-key',
  defaultQuote: 'NPR',
);

const AlertRuleModel rule = AlertRuleModel(
  id: 1,
  name: 'NPR above 151',
  base: 'USD',
  quote: 'NPR',
  condition: AlertCondition.above,
  threshold: 151,
  enabled: true,
  cooldownSeconds: 21600,
  createdAt: '2026-11-12T00:00:00.000Z',
  updatedAt: '2026-11-12T00:00:00.000Z',
);

void main() {
  late MockAlertsRepo repo;
  late MockRatesRepo ratesRepo;

  setUp(() {
    repo = MockAlertsRepo();
    ratesRepo = MockRatesRepo();
    when(() => ratesRepo.trackedQuotes()).thenAnswer(
      (_) async => const Result<List<String>>.success(<String>['NPR']),
    );
  });

  test('loads rules and tracked quotes', () async {
    when(() => repo.fetchAll()).thenAnswer(
      (_) async =>
          const Result<List<AlertRuleModel>>.success(<AlertRuleModel>[rule]),
    );

    final AlertsCubit cubit = AlertsCubit(repo, ratesRepo, env);
    await cubit.load();

    expect(cubit.state.ids, <int>[1]);
    expect(cubit.state.byId[1]?.threshold, 151);
    expect(cubit.state.quotes, <String>['NPR']);
    expect(cubit.state.status.name, 'success');
    await cubit.close();
  });

  test('creates an alert and prepends it to the list', () async {
    when(() => repo.fetchAll()).thenAnswer(
      (_) async =>
          const Result<List<AlertRuleModel>>.success(<AlertRuleModel>[rule]),
    );
    when(
      () => repo.create(
        quote: 'NPR',
        condition: AlertCondition.below,
        threshold: 149,
        name: null,
      ),
    ).thenAnswer(
      (_) async => Result<AlertRuleModel>.success(
        rule.copyWith(id: 2, condition: AlertCondition.below, threshold: 149),
      ),
    );

    final AlertsCubit cubit = AlertsCubit(repo, ratesRepo, env);
    await cubit.load();
    await cubit.create(
      quote: 'NPR',
      condition: AlertCondition.below,
      threshold: 149,
    );

    expect(cubit.state.submitStatus, AlertSubmitStatus.success);
    expect(cubit.state.ids.first, 2);
    expect(cubit.state.byId[2]?.condition, AlertCondition.below);
    await cubit.close();
  });

  test('toggles a rule and clears the busy marker', () async {
    when(() => repo.fetchAll()).thenAnswer(
      (_) async =>
          const Result<List<AlertRuleModel>>.success(<AlertRuleModel>[rule]),
    );
    when(() => repo.setEnabled(1, false)).thenAnswer(
      (_) async =>
          Result<AlertRuleModel>.success(rule.copyWith(enabled: false)),
    );

    final AlertsCubit cubit = AlertsCubit(repo, ratesRepo, env);
    await cubit.load();
    await cubit.toggle(1);

    expect(cubit.state.byId[1]?.enabled, isFalse);
    expect(cubit.state.busyId, isNull);
    await cubit.close();
  });

  test('reports a failure when creating an alert fails', () async {
    when(() => repo.fetchAll()).thenAnswer(
      (_) async =>
          const Result<List<AlertRuleModel>>.success(<AlertRuleModel>[]),
    );
    when(
      () => repo.create(
        quote: 'NPR',
        condition: AlertCondition.above,
        threshold: 151,
        name: null,
      ),
    ).thenAnswer(
      (_) async => const Result<AlertRuleModel>.failure(Failure.unauthorized()),
    );

    final AlertsCubit cubit = AlertsCubit(repo, ratesRepo, env);
    await cubit.load();
    await cubit.create(
      quote: 'NPR',
      condition: AlertCondition.above,
      threshold: 151,
    );

    expect(cubit.state.submitStatus, AlertSubmitStatus.failure);
    expect(cubit.state.failure?.kind, FailureKind.unauthorized);
    await cubit.close();
  });
}
