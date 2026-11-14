import 'package:flutter_test/flutter_test.dart';
import 'package:usd_tracker/features/alerts/data/models/alert_models.dart';
import 'package:usd_tracker/features/alerts/ui/widgets/alert_form.dart';

void main() {
  test('threshold must be a positive number', () {
    final AlertForm form = AlertForm.create(quotes: <String>['NPR']);

    expect(form.conditionValue, AlertCondition.above);
    expect(form.quote.value, 'NPR');
    expect(form.group.valid, isFalse);

    form.threshold.value = '0';
    expect(form.group.valid, isFalse);

    form.threshold.value = 'abc';
    expect(form.group.valid, isFalse);

    form.threshold.value = '151.5';
    expect(form.group.valid, isTrue);
    expect(form.thresholdValue, 151.5);

    form.dispose();
  });

  test('condition and label map to domain values', () {
    final AlertForm form = AlertForm.create(quotes: <String>['NPR']);
    form.threshold.value = '149';

    form.condition.value = 'below';
    expect(form.conditionValue, AlertCondition.below);

    form.name.value = '  Support test  ';
    expect(form.nameValue, 'Support test');

    form.name.value = '   ';
    expect(form.nameValue, isNull);

    form.dispose();
  });
}
