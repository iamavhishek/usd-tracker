import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../features/alerts/bloc/alerts_cubit.dart';
import '../../features/alerts/ui/pages/alerts_page.dart';
import '../../features/rates/bloc/rates_cubit.dart';
import '../../features/rates/ui/pages/rates_page.dart';
import '../../features/settings/bloc/settings_cubit.dart';
import '../../features/settings/ui/pages/settings_page.dart';
import '../di/service_locator.dart';
import 'app_shell.dart';
import 'routes.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: const String.fromEnvironment(
      'INITIAL_ROUTE',
      defaultValue: Routes.rates,
    ),
    debugLogDiagnostics: kDebugMode,
    routes: <RouteBase>[
      // Old push payloads used /rates/<quote>; the app has one rate screen.
      GoRoute(
        path: '/rates/:quote',
        redirect: (BuildContext context, GoRouterState state) => Routes.rates,
      ),
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) {
              return AppShell(navigationShell: navigationShell);
            },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.rates,
                builder: (BuildContext context, GoRouterState state) {
                  return BlocProvider<RatesCubit>(
                    create: (BuildContext context) =>
                        getIt<RatesCubit>()..load(),
                    child: const RatesPage(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.alerts,
                builder: (BuildContext context, GoRouterState state) {
                  return BlocProvider<AlertsCubit>(
                    create: (BuildContext context) =>
                        getIt<AlertsCubit>()..load(),
                    child: const AlertsPage(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.settings,
                builder: (BuildContext context, GoRouterState state) {
                  return BlocProvider<SettingsCubit>(
                    create: (BuildContext context) =>
                        getIt<SettingsCubit>()..load(),
                    child: const SettingsPage(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
