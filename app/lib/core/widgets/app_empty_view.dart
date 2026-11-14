import 'package:material_ui/material_ui.dart';

import '../icons/app_icons.dart';
import '../theme/app_palette.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/context_x.dart';

class AppEmptyView extends StatelessWidget {
  const AppEmptyView({
    super.key,
    required this.title,
    required this.message,
    this.icon = AppIcons.history,
    this.action,
    this.dense = false,
  });

  final String title;
  final String message;
  final IconData icon;
  final Widget? action;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.x6,
        vertical: dense ? AppSpacing.x4 : AppSpacing.x8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: AppSizes.control,
            height: AppSizes.control,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: palette.accent.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(icon, size: AppSizes.icon, color: palette.accent),
          ),
          const SizedBox(height: AppSpacing.x4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.text.titleMedium,
          ),
          const SizedBox(height: AppSpacing.x2),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSizes.messageWidth),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: context.text.bodyMedium?.copyWith(color: palette.inkMuted),
            ),
          ),
          if (action != null) ...<Widget>[
            const SizedBox(height: AppSpacing.x6),
            action!,
          ],
        ],
      ),
    );
  }
}
