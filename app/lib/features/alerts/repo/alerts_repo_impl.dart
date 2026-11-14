import '../../../../core/errors/result.dart';
import '../../../../core/errors/run_catching.dart';
import '../data/datasources/alerts_remote_datasource.dart';
import '../data/models/alert_models.dart';
import 'alerts_repo.dart';

class AlertsRepoImpl implements AlertsRepo {
  AlertsRepoImpl(this._remote);

  final AlertsRemoteDataSource _remote;

  @override
  Future<Result<List<AlertRuleModel>>> fetchAll() {
    return runCatchingExceptions<List<AlertRuleModel>>(_remote.fetchAll);
  }

  @override
  Future<Result<AlertRuleModel>> create({
    required String quote,
    required AlertCondition condition,
    required double threshold,
    String? name,
  }) {
    return runCatchingExceptions<AlertRuleModel>(
      () => _remote.create(
        quote: quote,
        condition: condition,
        threshold: threshold,
        name: name,
      ),
    );
  }

  @override
  Future<Result<AlertRuleModel>> setEnabled(int id, bool enabled) {
    return runCatchingExceptions<AlertRuleModel>(
      () => _remote.setEnabled(id, enabled),
    );
  }

  @override
  Future<Result<void>> delete(int id) {
    return runCatchingExceptions<void>(() => _remote.delete(id));
  }
}
