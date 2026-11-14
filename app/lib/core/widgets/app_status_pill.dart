import 'package:material_ui/material_ui.dart';

import '../theme/app_palette.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/context_x.dart';

enum AppPillTone { neutral, accent, danger, success }

class AppStatusPill extends StatelessWidget {
  const AppStatusPill({
    super.key,
    required this.label,
    this.tone = AppPillTone.neutral,
    this.icon,
  });

  final String label;
  final AppPillTone tone;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final Color foreground = switch (tone) {
      AppPillTone.neutral => palette.inkMuted,
      AppPillTone.accent => palette.accent,
      AppPillTone.danger => palette.danger,
      AppPillTone.success => palette.success,
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.x2,
        vertical: AppSpacing.x1,
      ),
      decoration: BoxDecoration(
        color: foreground.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: AppSizes.iconSm, color: foreground),
            const SizedBox(width: AppSpacing.x1),
          ],
          Text(
            label,
            style: context.text.labelMedium?.copyWith(
              color: foreground,
              fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}
