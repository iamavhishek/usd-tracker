import 'package:material_ui/material_ui.dart';

import '../theme/app_palette.dart';
import '../theme/app_motion.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../theme/context_x.dart';
import 'app_pressable.dart';
import 'app_spinner.dart';

enum AppButtonVariant { primary, secondary, quiet, danger }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.variant = AppButtonVariant.primary,
    this.expand = false,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final AppButtonVariant variant;
  final bool expand;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final bool enabled = onPressed != null && !loading;

    final Color background = switch (variant) {
      AppButtonVariant.primary =>
        enabled ? palette.accent : palette.accent.withValues(alpha: 0.35),
      AppButtonVariant.secondary => palette.surface,
      AppButtonVariant.quiet => palette.canvas.withValues(alpha: 0),
      AppButtonVariant.danger =>
        enabled ? palette.danger : palette.danger.withValues(alpha: 0.35),
    };

    final Color foreground = switch (variant) {
      AppButtonVariant.primary || AppButtonVariant.danger => palette.onAccent,
      AppButtonVariant.secondary ||
      AppButtonVariant.quiet => enabled ? palette.ink : palette.inkFaint,
    };

    final BorderSide? border = variant == AppButtonVariant.secondary
        ? BorderSide(color: palette.line, width: AppSizes.hairline)
        : null;

    final Widget labelChild = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (icon != null) ...<Widget>[
          Icon(icon, size: AppSizes.iconSm, color: foreground),
          const SizedBox(width: AppSpacing.x2),
        ],
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.text.labelLarge?.copyWith(color: foreground),
          ),
        ),
      ],
    );

    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      child: AppPressable(
        onPressed: enabled ? onPressed : null,
        pressedColor: variant == AppButtonVariant.primary
            ? Color.lerp(palette.accent, palette.ink, 0.12)
            : palette.line,
        borderRadius: AppRadius.md,
        child: AnimatedContainer(
          duration: AppMotion.of(context, AppMotion.fast),
          curve: AppMotion.feedback,
          height: AppSizes.control,
          width: expand ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x4),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: border == null ? null : Border.fromBorderSide(border),
          ),
          child: DefaultTextHeightBehavior(
            textHeightBehavior: kCenteredText,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedOpacity(
                  duration: AppMotion.of(context, AppMotion.fast),
                  opacity: loading ? 0 : 1,
                  child: labelChild,
                ),
                if (loading) AppSpinner(color: foreground),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
