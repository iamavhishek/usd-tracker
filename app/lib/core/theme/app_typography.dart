import 'package:material_ui/material_ui.dart';

import 'app_palette.dart';

/// One family (the platform sans), hierarchy from size plus a single weight
/// step. Sizes stay at or above 12 so small text remains legible.
abstract final class AppTypography {
  static TextTheme build(AppPalette palette) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 44,
        height: 1.0,
        fontWeight: FontWeight.w600,
        letterSpacing: -1.4,
        color: palette.ink,
      ),
      displayMedium: TextStyle(
        fontSize: 34,
        height: 1.05,
        fontWeight: FontWeight.w600,
        letterSpacing: -1.0,
        color: palette.ink,
      ),
      displaySmall: TextStyle(
        fontSize: 28,
        height: 1.15,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.6,
        color: palette.ink,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        height: 1.2,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        color: palette.ink,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        height: 1.2,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        color: palette.ink,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: palette.ink,
      ),
      bodyLarge: TextStyle(fontSize: 16, height: 1.45, color: palette.ink),
      bodyMedium: TextStyle(fontSize: 14, height: 1.45, color: palette.ink),
      bodySmall: TextStyle(fontSize: 12, height: 1.35, color: palette.inkMuted),
      labelLarge: TextStyle(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: palette.ink,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w500,
        color: palette.inkMuted,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w500,
        color: palette.inkFaint,
      ),
    );
  }
}

extension TextStyleX on TextStyle {
  /// Aligned digits for rates, deltas and counters.
  TextStyle get tabular =>
      copyWith(fontFeatures: const <FontFeature>[FontFeature.tabularFigures()]);
}

/// Optical centring for labels inside buttons, pills and avatars.
const TextHeightBehavior kCenteredText = TextHeightBehavior(
  applyHeightToFirstAscent: false,
  applyHeightToLastDescent: false,
  leadingDistribution: TextLeadingDistribution.even,
);
