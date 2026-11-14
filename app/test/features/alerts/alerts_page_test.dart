import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:usd_tracker/core/config/app_env.dart';
import 'package:usd_tracker/core/errors/result.dart';
import 'package:usd_tracker/core/theme/app_theme.dart';
import 'package:usd_tracker/features/alerts/bloc/alerts_cubit.dart';
import 'package:usd_tracker/features/alerts/data/models/alert_models.dart';
import 'package:usd_tracker/features/alerts/repo/alerts_repo.dart';
import 'package:usd_tracker/features/alerts/ui/pages/alerts_page.dart';
import 'package:usd_tracker/features/rates/repo/rates_repo.dart';

class MockAlertsRepo extends Mock implements AlertsRepo {}

class MockRatesRepo extends Mock implements RatesRepo {}

const AppEnv env = AppEnv(
  flavor: AppFlavor.dev,
  baseUrl: 'http://127.0.0.1:3000/api/v1',
  apiKey: '',
  defaultQuote: 'NPR',
);

void main() {
  testWidgets('opens the inline alert form from the empty state', (
    WidgetTester tester,
  ) async {
    final MockAlertsRepo repo = MockAlertsRepo();
    final MockRatesRepo ratesRepo = MockRatesRepo();
    when(repo.fetchAll).thenAnswer(
      (_) async =>
          const Result<List<AlertRuleModel>>.success(<AlertRuleModel>[]),
    );
    when(ratesRepo.trackedQuotes).thenAnswer(
      (_) async => const Result<List<String>>.success(<String>['NPR']),
    );

    final AlertsCubit cubit = AlertsCubit(repo, ratesRepo, env);
    await cubit.load();

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: BlocProvider<AlertsCubit>.value(
          value: cubit,
          child: const AlertsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No alerts yet'), findsOneWidget);

    await tester.tap(find.byTooltip('New alert'));
    await tester.pumpAndSettle();

    expect(find.text('New alert'), findsOneWidget);
    expect(find.text('Rate threshold'), findsOneWidget);
    expect(find.text('Create alert'), findsOneWidget);

    await cubit.close();
  });
}
