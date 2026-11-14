import 'package:material_ui/material_ui.dart';

/// 4pt grid.
abstract final class AppSpacing {
  static const double x1 = 4.0;
  static const double x2 = 8.0;
  static const double x3 = 12.0;
  static const double x4 = 16.0;
  static const double x6 = 24.0;
  static const double x8 = 32.0;
  static const double x12 = 48.0;
}

abstract final class AppInsets {
  static const EdgeInsets page = EdgeInsets.symmetric(
    horizontal: AppSpacing.x4,
  );
  static const EdgeInsets pageTop = EdgeInsets.fromLTRB(
    AppSpacing.x4,
    AppSpacing.x2,
    AppSpacing.x4,
    0,
  );
  static const EdgeInsets card = EdgeInsets.all(AppSpacing.x3);
  static const EdgeInsets row = EdgeInsets.symmetric(
    horizontal: AppSpacing.x3,
    vertical: AppSpacing.x3,
  );
  static const EdgeInsets field = EdgeInsets.symmetric(
    horizontal: AppSpacing.x3,
    vertical: AppSpacing.x3,
  );
  static const EdgeInsets sheet = EdgeInsets.fromLTRB(
    AppSpacing.x4,
    AppSpacing.x3,
    AppSpacing.x4,
    AppSpacing.x6,
  );
}
