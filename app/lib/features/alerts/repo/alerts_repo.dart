import '../../../../core/errors/result.dart';
import '../data/models/alert_models.dart';

abstract class AlertsRepo {
  Future<Result<List<AlertRuleModel>>> fetchAll();

  Future<Result<AlertRuleModel>> create({
    required String quote,
    required AlertCondition condition,
    required double threshold,
    String? name,
  });

  Future<Result<AlertRuleModel>> setEnabled(int id, bool enabled);

  Future<Result<void>> delete(int id);
}
