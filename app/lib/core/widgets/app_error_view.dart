import 'package:material_ui/material_ui.dart';

import '../errors/failure.dart';
import '../errors/failure_copy.dart';
import '../icons/app_icons.dart';
import '../theme/app_palette.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/context_x.dart';
import 'app_button.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({
    super.key,
    required this.title,
    required this.message,
    this.onRetry,
    this.dense = false,
  });

  final String title;
  final String message;
  final VoidCallback? onRetry;
  final bool dense;

  static Widget fromFailure(Failure failure, {VoidCallback? onRetry}) {
    return AppErrorView(
      title: failure.headline,
      message: failure.detail,
      onRetry: failure.isRetryable ? onRetry : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.x6,
          vertical: dense ? AppSpacing.x4 : AppSpacing.x8,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.messageWidth),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: AppSizes.control,
                height: AppSizes.control,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: palette.danger.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  AppIcons.offline,
                  size: AppSizes.icon,
                  color: palette.danger,
                ),
              ),
              const SizedBox(height: AppSpacing.x4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.text.titleMedium,
              ),
              const SizedBox(height: AppSpacing.x2),
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.text.bodyMedium?.copyWith(
                  color: palette.inkMuted,
                ),
              ),
              if (onRetry != null) ...<Widget>[
                const SizedBox(height: AppSpacing.x6),
                AppButton(
                  label: 'Try again',
                  variant: AppButtonVariant.secondary,
                  onPressed: onRetry,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
