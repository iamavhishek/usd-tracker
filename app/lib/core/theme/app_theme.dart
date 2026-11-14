import 'package:material_ui/material_ui.dart';

import 'app_palette.dart';
import 'app_sizes.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData get light => _build(AppPalette.light, Brightness.light);

  static ThemeData get dark => _build(AppPalette.dark, Brightness.dark);

  static ThemeData _build(AppPalette palette, Brightness brightness) {
    final ColorScheme scheme =
        ColorScheme.fromSeed(
          seedColor: palette.accent,
          brightness: brightness,
        ).copyWith(
          primary: palette.accent,
          onPrimary: palette.onAccent,
          surface: palette.surface,
          onSurface: palette.ink,
          error: palette.danger,
          outlineVariant: palette.line,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      canvasColor: palette.canvas,
      scaffoldBackgroundColor: palette.canvas,
      textTheme: AppTypography.build(palette),
      iconTheme: IconThemeData(color: palette.inkMuted, size: AppSizes.icon),
      splashFactory: NoSplash.splashFactory,
      dividerTheme: DividerThemeData(
        color: palette.line,
        thickness: AppSizes.hairline,
        space: AppSizes.hairline,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: palette.accent,
        linearMinHeight: AppSizes.spinnerStroke,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? palette.onAccent
              : palette.inkFaint,
        ),
        trackColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? palette.accent
              : palette.line,
        ),
        trackOutlineColor: WidgetStatePropertyAll<Color>(palette.line),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: palette.accent,
        selectionColor: palette.accent.withValues(alpha: 0.2),
        selectionHandleColor: palette.accent,
      ),
      extensions: <ThemeExtension<dynamic>>[palette],
    );
  }
}
