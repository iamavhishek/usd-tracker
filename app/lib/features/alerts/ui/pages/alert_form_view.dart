import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/context_x.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_choice_row.dart';
import '../../../../core/widgets/app_reactive_dropdown_field.dart';
import '../../../../core/widgets/app_reactive_text_field.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../bloc/alerts_cubit.dart';
import '../../bloc/alerts_state.dart';
import '../../data/models/alert_models.dart';
import '../widgets/alert_form.dart';

class AlertFormView extends StatefulWidget {
  const AlertFormView({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<AlertFormView> createState() => _AlertFormViewState();
}

class _AlertFormViewState extends State<AlertFormView> {
  late final AlertForm _form;
  late final List<String> _quotes;

  @override
  void initState() {
    super.initState();
    final List<String> quotes = context.read<AlertsCubit>().state.quotes;
    _quotes = quotes.isEmpty ? <String>['NPR'] : quotes;
    _form = AlertForm.create(quotes: _quotes);
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  void _submit() {
    if (_form.group.invalid) {
      _form.group.markAllAsTouched();
      return;
    }

    final AlertCondition? condition = _form.conditionValue;
    final double? threshold = _form.thresholdValue;
    final String? quote = _form.quote.value;

    if (condition == null || threshold == null || quote == null) return;

    context.read<AlertsCubit>().create(
      quote: quote,
      condition: condition,
      threshold: threshold,
      name: _form.nameValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AlertsCubit, AlertsState>(
      listenWhen: (AlertsState previous, AlertsState next) =>
          previous.submitStatus != next.submitStatus,
      listener: (BuildContext context, AlertsState state) {
        switch (state.submitStatus) {
          case AlertSubmitStatus.success:
            context.read<AlertsCubit>().resetSubmitStatus();
            widget.onClose();
          case AlertSubmitStatus.failure:
            if (state.failure != null) {
              AppSnackBar.showFailure(context, state.failure!);
            }
          case AlertSubmitStatus.idle || AlertSubmitStatus.submitting:
            break;
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (!didPop) widget.onClose();
        },
        child: AppScaffold(
          title: 'New alert',
          subtitle: 'One push when the rate crosses your line',
          onBack: widget.onClose,
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.x4,
              AppSpacing.x2,
              AppSpacing.x4,
              AppSpacing.x12,
            ),
            child: ReactiveForm(
              formGroup: _form.group,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AppReactiveDropdownField<String>(
                    formControlName: AlertForm.quoteKey,
                    label: 'Currency',
                    items: <DropdownMenuItem<String>>[
                      for (final String quote in _quotes)
                        DropdownMenuItem<String>(
                          value: quote,
                          child: Text('USD / $quote'),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.x6),
                  Text(
                    'Notify me when the rate is',
                    style: context.text.labelMedium,
                  ),
                  const SizedBox(height: AppSpacing.x2),
                  ReactiveFormField<String, String>(
                    formControlName: AlertForm.conditionKey,
                    builder: (ReactiveFormFieldState<String, String> field) {
                      return AppChoiceRow<String>(
                        values: const <String>['above', 'below'],
                        selected: field.value ?? 'above',
                        labelFor: (String value) =>
                            value == 'above' ? 'Above' : 'Below',
                        onChanged: (String value) => field.didChange(value),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.x4),
                  AppReactiveTextField(
                    formControlName: AlertForm.thresholdKey,
                    label: 'Rate threshold',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    textInputAction: TextInputAction.next,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.x4),
                  const AppReactiveTextField(
                    formControlName: AlertForm.nameKey,
                    label: 'Label (optional)',
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: AppSpacing.x4),
                  Text(
                    'Alerts fire once per crossing. The backend applies a 6 h '
                    'cooldown so a rate that flaps does not spam you.',
                    style: context.text.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.x8),
                  BlocSelector<AlertsCubit, AlertsState, bool>(
                    selector: (AlertsState state) =>
                        state.submitStatus == AlertSubmitStatus.submitting,
                    builder: (BuildContext context, bool loading) {
                      return ReactiveFormConsumer(
                        builder:
                            (
                              BuildContext context,
                              FormGroup form,
                              Widget? child,
                            ) {
                              return AppButton(
                                label: 'Create alert',
                                expand: true,
                                loading: loading,
                                onPressed: form.valid && !loading
                                    ? _submit
                                    : null,
                              );
                            },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
