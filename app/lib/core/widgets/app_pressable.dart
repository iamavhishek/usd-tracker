import 'package:material_ui/material_ui.dart';

import '../theme/app_palette.dart';
import '../theme/app_motion.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/context_x.dart';

/// Tap feedback without Material's ripple. A one-step surface change within
/// [AppMotion.instant].
class AppPressable extends StatefulWidget {
  const AppPressable({
    super.key,
    required this.onPressed,
    required this.child,
    this.semanticLabel,
    this.borderRadius,
    this.pressedColor,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final String? semanticLabel;
  final double? borderRadius;
  final Color? pressedColor;

  @override
  State<AppPressable> createState() => _AppPressableState();
}

class _AppPressableState extends State<AppPressable> {
  bool _down = false;

  void _setDown(bool value) {
    if (_down != value) setState(() => _down = value);
  }

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final bool enabled = widget.onPressed != null;

    return Semantics(
      button: true,
      enabled: enabled,
      label: widget.semanticLabel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? (TapDownDetails _) => _setDown(true) : null,
        onTapUp: enabled ? (TapUpDetails _) => _setDown(false) : null,
        onTapCancel: enabled ? () => _setDown(false) : null,
        onTap: widget.onPressed,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: AppSizes.tap,
            minHeight: AppSizes.tap,
          ),
          child: AnimatedContainer(
            duration: AppMotion.of(context, AppMotion.instant),
            curve: AppMotion.feedback,
            decoration: BoxDecoration(
              color: _down
                  ? (widget.pressedColor ?? palette.line).withValues(alpha: 0.6)
                  : palette.canvas.withValues(alpha: 0),
              borderRadius: BorderRadius.circular(
                widget.borderRadius ?? AppRadius.md,
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
