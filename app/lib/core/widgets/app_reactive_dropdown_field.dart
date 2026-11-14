import 'package:material_ui/material_ui.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../icons/app_icons.dart';
import '../theme/app_palette.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/context_x.dart';

class AppReactiveDropdownField<T> extends StatelessWidget {
  const AppReactiveDropdownField({
    super.key,
    required this.formControlName,
    required this.label,
    required this.items,
  });

  final String formControlName;
  final String label;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return ReactiveDropdownField<T>(
      formControlName: formControlName,
      items: items,
      isExpanded: true,
      style: context.text.bodyLarge,
      icon: Icon(
        AppIcons.chevron,
        size: AppSizes.iconSm,
        color: palette.inkMuted,
      ),
      borderRadius: BorderRadius.circular(AppRadius.md),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: context.text.bodyMedium?.copyWith(color: palette.inkMuted),
        floatingLabelStyle: context.text.labelMedium,
        filled: true,
        fillColor: palette.surface,
        contentPadding: AppInsets.field,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: palette.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: palette.line, width: AppSizes.hairline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(
            color: palette.accent,
            width: AppSizes.focusRing,
          ),
        ),
      ),
    );
  }
}
