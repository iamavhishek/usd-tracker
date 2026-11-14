import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:usd_tracker/core/config/app_env.dart';
import 'package:usd_tracker/core/errors/result.dart';
import 'package:usd_tracker/core/theme/app_theme.dart';
import 'package:material_ui/material_ui.dart';
import 'package:usd_tracker/features/alerts/bloc/alerts_cubit.dart';
import 'package:usd_tracker/features/alerts/data/models/alert_models.dart';
import 'package:usd_tracker/features/alerts/repo/alerts_repo.dart';
import 'package:usd_tracker/features/alerts/ui/widgets/alert_row.dart';
import 'package:usd_tracker/features/rates/repo/rates_repo.dart';

class MockAlertsRepo extends Mock implements AlertsRepo {}

class MockRatesRepo extends Mock implements RatesRepo {}

const AppEnv env = AppEnv(
  flavor: AppFlavor.dev,
  baseUrl: 'http://127.0.0.1:3000/api/v1',
  apiKey: '',
  defaultQuote: 'NPR',
);

const AlertRuleModel ruleOne = AlertRuleModel(
  id: 1,
  base: 'USD',
  quote: 'NPR',
  condition: AlertCondition.above,
  threshold: 151,
  enabled: true,
  cooldownSeconds: 21600,
  createdAt: '2026-11-12T00:00:00.000Z',
  updatedAt: '2026-11-12T00:00:00.000Z',
);

const AlertRuleModel ruleTwo = AlertRuleModel(
  id: 2,
  base: 'USD',
  quote: 'NPR',
  condition: AlertCondition.below,
  threshold: 149,
  enabled: true,
  cooldownSeconds: 21600,
  createdAt: '2026-11-12T00:00:00.000Z',
  updatedAt: '2026-11-12T00:00:00.000Z',
);

void main() {
  testWidgets('toggling one alert rebuilds only that row', (
    WidgetTester tester,
  ) async {
    final MockAlertsRepo repo = MockAlertsRepo();
    final MockRatesRepo ratesRepo = MockRatesRepo();

    when(repo.fetchAll).thenAnswer(
      (_) async => const Result<List<AlertRuleModel>>.success(<AlertRuleModel>[
        ruleOne,
        ruleTwo,
      ]),
    );
    when(ratesRepo.trackedQuotes).thenAnswer(
      (_) async => const Result<List<String>>.success(<String>['NPR']),
    );
    when(() => repo.setEnabled(1, false)).thenAnswer(
      (_) async =>
          Result<AlertRuleModel>.success(ruleOne.copyWith(enabled: false)),
    );

    final AlertsCubit cubit = AlertsCubit(repo, ratesRepo, env);
    await cubit.load();

    int rowOneBuilds = 0;
    int rowTwoBuilds = 0;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: BlocProvider<AlertsCubit>.value(
            value: cubit,
            child: Column(
              children: <Widget>[
                AlertRow(id: 1, onBuild: () => rowOneBuilds += 1),
                AlertRow(id: 2, onBuild: () => rowTwoBuilds += 1),
              ],
            ),
          ),
        ),
      ),
    );

    expect(rowOneBuilds, 1);
    expect(rowTwoBuilds, 1);

    await cubit.toggle(1);
    await tester.pumpAndSettle();

    expect(rowOneBuilds, greaterThan(1));
    expect(rowTwoBuilds, 1);

    await cubit.close();
  });
}
