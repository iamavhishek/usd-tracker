import 'package:material_ui/material_ui.dart';

import '../errors/failure.dart';
import '../errors/failure_copy.dart';
import '../theme/app_palette.dart';
import '../theme/app_motion.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/context_x.dart';

abstract final class AppSnackBar {
  static void show(BuildContext context, String message) {
    final AppPalette palette = context.palette;
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: context.text.bodyMedium?.copyWith(color: palette.canvas),
          ),
          backgroundColor: palette.ink,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          margin: const EdgeInsets.all(AppSpacing.x4),
          duration: AppMotion.toast,
          elevation: 0,
        ),
      );
  }

  static void showFailure(BuildContext context, Failure failure) {
    show(context, '${failure.headline}. ${failure.detail}');
  }
}
