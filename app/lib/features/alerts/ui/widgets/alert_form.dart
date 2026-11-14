import 'package:reactive_forms/reactive_forms.dart';

import '../../data/models/alert_models.dart';

/// Typed form holder: controls and validity only, no Bloc state.
class AlertForm {
  AlertForm._({
    required this.quote,
    required this.condition,
    required this.threshold,
    required this.name,
    required this.group,
  });

  factory AlertForm.create({required List<String> quotes}) {
    final FormControl<String> quote = FormControl<String>(value: quotes.first);
    final FormControl<String> condition = FormControl<String>(
      value: AlertCondition.above.name,
    );
    final FormControl<String> threshold = FormControl<String>(
      validators: <Validator<dynamic>>[
        Validators.required,
        Validators.delegate(_positiveNumber),
      ],
    );
    final FormControl<String> name = FormControl<String>();

    return AlertForm._(
      quote: quote,
      condition: condition,
      threshold: threshold,
      name: name,
      group: FormGroup(<String, AbstractControl<dynamic>>{
        quoteKey: quote,
        conditionKey: condition,
        thresholdKey: threshold,
        nameKey: name,
      }),
    );
  }

  static const String quoteKey = 'quote';
  static const String conditionKey = 'condition';
  static const String thresholdKey = 'threshold';
  static const String nameKey = 'name';

  final FormControl<String> quote;
  final FormControl<String> condition;
  final FormControl<String> threshold;
  final FormControl<String> name;
  final FormGroup group;

  double? get thresholdValue {
    final String? raw = threshold.value?.trim();
    return raw == null ? null : double.tryParse(raw);
  }

  AlertCondition? get conditionValue {
    return switch (condition.value) {
      'above' => AlertCondition.above,
      'below' => AlertCondition.below,
      _ => null,
    };
  }

  String? get nameValue {
    final String? raw = name.value?.trim();
    return raw == null || raw.isEmpty ? null : raw;
  }

  void dispose() => group.dispose();
}

Map<String, dynamic>? _positiveNumber(AbstractControl<dynamic> control) {
  final Object? value = control.value;
  if (value is! String || value.trim().isEmpty) return null;

  final double? parsed = double.tryParse(value.trim());
  if (parsed == null || parsed <= 0) {
    return <String, dynamic>{'positiveNumber': true};
  }
  return null;
}
