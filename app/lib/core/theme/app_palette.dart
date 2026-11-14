import 'package:material_ui/material_ui.dart';

/// Semantic colours. Raw values live only in `core/theme/**`; widgets read
/// `context.palette.*` so light and dark are correct by construction.
@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.canvas,
    required this.surface,
    required this.raised,
    required this.line,
    required this.ink,
    required this.inkMuted,
    required this.inkFaint,
    required this.accent,
    required this.onAccent,
    required this.danger,
    required this.success,
  });

  /// Screen background — warm bone in light mode, forest-black in dark.
  final Color canvas;

  /// Cards, fields and sheets.
  final Color surface;

  /// Popovers and raised surfaces (a lighter step on dark).
  final Color raised;

  /// Hairlines.
  final Color line;

  /// Primary text.
  final Color ink;

  /// Secondary text.
  final Color inkMuted;

  /// Placeholders and disabled content only.
  final Color inkFaint;

  /// Forest green brand accent.
  final Color accent;

  /// Text/icons on an accent fill.
  final Color onAccent;

  final Color danger;

  final Color success;

  static const AppPalette light = AppPalette(
    canvas: Color(0xFFF4F1E8),
    surface: Color(0xFFFFFDF7),
    raised: Color(0xFFFFFFFF),
    line: Color(0xFFE3DDD0),
    ink: Color(0xFF17201B),
    inkMuted: Color(0xFF5B665E),
    inkFaint: Color(0xFF8A938B),
    accent: Color(0xFF1F5B4A),
    onAccent: Color(0xFFF7F4EA),
    danger: Color(0xFFB3402F),
    success: Color(0xFF2E6B4F),
  );

  static const AppPalette dark = AppPalette(
    canvas: Color(0xFF0E1410),
    surface: Color(0xFF161E19),
    raised: Color(0xFF202922),
    line: Color(0xFF2B362E),
    ink: Color(0xFFEDF0E9),
    inkMuted: Color(0xFFA6B0A7),
    inkFaint: Color(0xFF6F7A72),
    accent: Color(0xFF8FD0B5),
    onAccent: Color(0xFF0B1A12),
    danger: Color(0xFFF08A78),
    success: Color(0xFF7FD3A7),
  );

  @override
  AppPalette copyWith({
    Color? canvas,
    Color? surface,
    Color? raised,
    Color? line,
    Color? ink,
    Color? inkMuted,
    Color? inkFaint,
    Color? accent,
    Color? onAccent,
    Color? danger,
    Color? success,
  }) {
    return AppPalette(
      canvas: canvas ?? this.canvas,
      surface: surface ?? this.surface,
      raised: raised ?? this.raised,
      line: line ?? this.line,
      ink: ink ?? this.ink,
      inkMuted: inkMuted ?? this.inkMuted,
      inkFaint: inkFaint ?? this.inkFaint,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      danger: danger ?? this.danger,
      success: success ?? this.success,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;

    return AppPalette(
      canvas: Color.lerp(canvas, other.canvas, t) ?? canvas,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      raised: Color.lerp(raised, other.raised, t) ?? raised,
      line: Color.lerp(line, other.line, t) ?? line,
      ink: Color.lerp(ink, other.ink, t) ?? ink,
      inkMuted: Color.lerp(inkMuted, other.inkMuted, t) ?? inkMuted,
      inkFaint: Color.lerp(inkFaint, other.inkFaint, t) ?? inkFaint,
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      onAccent: Color.lerp(onAccent, other.onAccent, t) ?? onAccent,
      danger: Color.lerp(danger, other.danger, t) ?? danger,
      success: Color.lerp(success, other.success, t) ?? success,
    );
  }
}
