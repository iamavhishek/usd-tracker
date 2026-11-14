import 'package:material_ui/material_ui.dart';

import '../theme/app_palette.dart';
import '../theme/app_motion.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/context_x.dart';
import 'app_pressable.dart';

/// Segmented choice used inside reactive forms.
class AppChoiceRow<T> extends StatelessWidget {
  const AppChoiceRow({
    super.key,
    required this.values,
    required this.selected,
    required this.labelFor,
    required this.onChanged,
    this.enabled = true,
  });

  final List<T> values;
  final T selected;
  final String Function(T value) labelFor;
  final ValueChanged<T> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return Row(
      children: <Widget>[
        for (int index = 0; index < values.length; index++) ...<Widget>[
          if (index > 0) const SizedBox(width: AppSpacing.x2),
          Expanded(
            child: AppPressable(
              onPressed: enabled ? () => onChanged(values[index]) : null,
              borderRadius: AppRadius.md,
              child: AnimatedContainer(
                duration: AppMotion.of(context, AppMotion.fast),
                curve: AppMotion.feedback,
                height: AppSizes.control,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected == values[index]
                      ? palette.accent
                      : palette.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: selected == values[index]
                          ? palette.accent
                          : palette.line,
                      width: AppSizes.hairline,
                    ),
                  ),
                ),
                child: Text(
                  labelFor(values[index]),
                  style: context.text.labelLarge?.copyWith(
                    color: selected == values[index]
                        ? palette.onAccent
                        : enabled
                        ? palette.ink
                        : palette.inkFaint,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
