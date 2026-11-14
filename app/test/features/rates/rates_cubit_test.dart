import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:usd_tracker/core/config/app_env.dart';
import 'package:usd_tracker/core/errors/failure.dart';
import 'package:usd_tracker/core/errors/result.dart';
import 'package:usd_tracker/core/models/view_status.dart';
import 'package:usd_tracker/features/rates/bloc/rates_cubit.dart';
import 'package:usd_tracker/features/rates/bloc/rates_state.dart';
import 'package:usd_tracker/features/rates/data/models/rates_models.dart';
import 'package:usd_tracker/features/rates/repo/rates_repo.dart';

class MockRatesRepo extends Mock implements RatesRepo {}

const AppEnv env = AppEnv(
  flavor: AppFlavor.dev,
  baseUrl: 'http://127.0.0.1:3000/api/v1',
  apiKey: '',
  defaultQuote: 'NPR',
);

const RateModel rate = RateModel(
  base: 'USD',
  quote: 'NPR',
  rate: 150.37,
  rateDate: '2026-11-12',
  fetchedAt: '2026-11-12T21:51:00.000Z',
  provider: 'frankfurter',
  previousRate: 150.3,
  change: 0.07,
  changePercent: 0.05,
  direction: RateDirection.up,
);

const HistoryPointModel point = HistoryPointModel(
  rate: 150.37,
  rateDate: '2026-11-12',
  fetchedAt: '2026-11-12T21:51:00.000Z',
);

const RatesBundle bundle = RatesBundle(
  rate: rate,
  history: <HistoryPointModel>[point],
);

void main() {
  late MockRatesRepo repo;

  setUp(() {
    repo = MockRatesRepo();
  });

  blocTest<RatesCubit, RatesState>(
    'loads the rate and history',
    setUp: () {
      when(() => repo.load(quote: 'NPR'))
          .thenAnswer((_) async => const Result<RatesBundle>.success(bundle));
    },
    build: () => RatesCubit(repo, env),
    act: (RatesCubit cubit) => cubit.load(),
    expect: () => <RatesState>[
      const RatesState(status: ViewStatus.loading),
      const RatesState(
        status: ViewStatus.success,
        rate: rate,
        history: <HistoryPointModel>[point],
      ),
    ],
  );

  blocTest<RatesCubit, RatesState>(
    'exposes the failure when the first load fails',
    setUp: () {
      when(() => repo.load(quote: 'NPR')).thenAnswer(
        (_) async => const Result<RatesBundle>.failure(Failure.network()),
      );
    },
    build: () => RatesCubit(repo, env),
    act: (RatesCubit cubit) => cubit.load(),
    expect: () => <RatesState>[
      const RatesState(status: ViewStatus.loading),
      const RatesState(status: ViewStatus.failure, failure: Failure.network()),
    ],
  );

  test('retains data when a refresh fails', () async {
    int calls = 0;
    when(() => repo.load(quote: 'NPR')).thenAnswer((_) async {
      calls += 1;
      return calls == 1
          ? const Result<RatesBundle>.success(bundle)
          : const Result<RatesBundle>.failure(Failure.timeout());
    });

    final RatesCubit cubit = RatesCubit(repo, env);
    await cubit.load();
    await cubit.refresh();

    expect(cubit.state.hasRate, isTrue);
    expect(cubit.state.status, ViewStatus.success);
    expect(cubit.state.failure?.kind, FailureKind.timeout);
    await cubit.close();
  });

  test('backfill refreshes the feed', () async {
    when(() => repo.load(quote: 'NPR'))
        .thenAnswer((_) async => const Result<RatesBundle>.success(bundle));
    when(() => repo.backfill(quote: 'NPR'))
        .thenAnswer((_) async => const Result<void>.success(null));

    final RatesCubit cubit = RatesCubit(repo, env);
    await cubit.load();
    await cubit.backfill();

    verify(() => repo.backfill(quote: 'NPR')).called(1);
    verify(() => repo.load(quote: 'NPR')).called(2);
    expect(cubit.state.isBackfilling, isFalse);
    await cubit.close();
  });
}
