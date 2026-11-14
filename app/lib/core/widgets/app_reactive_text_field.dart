import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../theme/app_palette.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/context_x.dart';

/// The only text field in the app. Styling comes from tokens; validation copy
/// is centralised here.
class AppReactiveTextField extends StatelessWidget {
  const AppReactiveTextField({
    super.key,
    required this.formControlName,
    required this.label,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onSubmitted,
    this.inputFormatters,
  });

  final String formControlName;
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final VoidCallback? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return ReactiveTextField<String>(
      formControlName: formControlName,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      onSubmitted: onSubmitted == null
          ? null
          : (FormControl<String> _) => onSubmitted?.call(),
      style: context.text.bodyLarge,
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (Object _) =>
            'Enter your ${label.toLowerCase()}',
        ValidationMessage.number: (Object _) => 'Enter a number',
        ValidationMessage.min: (Object error) => 'Value is too small',
        'positiveNumber': (Object _) => 'Enter a rate greater than zero',
        'server': (Object error) => '$error',
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: context.text.bodyMedium?.copyWith(color: palette.inkMuted),
        floatingLabelStyle: context.text.labelMedium,
        filled: true,
        fillColor: palette.surface,
        contentPadding: AppInsets.field,
        errorStyle: context.text.bodySmall?.copyWith(color: palette.danger),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: palette.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: palette.line, width: AppSizes.hairline),
        ),
        disabledBorder: OutlineInputBorder(
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: palette.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(
            color: palette.danger,
            width: AppSizes.focusRing,
          ),
        ),
      ),
    );
  }
}
