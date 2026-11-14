import 'package:material_ui/material_ui.dart';

import '../theme/app_palette.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/context_x.dart';
import 'app_pressable.dart';
import 'app_spinner.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    this.onPressed,
    this.loading = false,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final bool enabled = onPressed != null && !loading;

    return Tooltip(
      message: tooltip,
      child: AppPressable(
        onPressed: enabled ? onPressed : null,
        semanticLabel: tooltip,
        borderRadius: AppRadius.pill,
        pressedColor: palette.line,
        child: SizedBox(
          width: AppSizes.tap,
          height: AppSizes.tap,
          child: Center(
            child: loading
                ? const AppSpinner()
                : Icon(
                    icon,
                    size: AppSizes.icon,
                    color: enabled ? palette.ink : palette.inkFaint,
                  ),
          ),
        ),
      ),
    );
  }
}
