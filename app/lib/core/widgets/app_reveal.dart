import 'package:material_ui/material_ui.dart';

import '../theme/app_motion.dart';
import '../theme/app_spacing.dart';

/// First-appearance reveal, capped at eight items. Pagination and refreshes
/// must not re-trigger it.
class AppReveal extends StatelessWidget {
  const AppReveal({super.key, required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return child;

    final int slot = index > 8 ? 8 : index;
    final Duration lead = AppMotion.stagger * slot;
    final Duration total = AppMotion.slow + lead;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: total,
      curve: Interval(
        lead.inMilliseconds / total.inMilliseconds,
        1,
        curve: AppMotion.arrive,
      ),
      child: child,
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * AppSpacing.x2),
            child: child,
          ),
        );
      },
    );
  }
}
