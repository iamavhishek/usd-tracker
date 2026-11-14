import '../../../../core/errors/result.dart';
import '../../../../core/errors/run_catching.dart';
import '../data/datasources/settings_remote_datasource.dart';
import '../data/models/settings_models.dart';
import 'settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  SettingsRepoImpl(this._remote);

  final SettingsRemoteDataSource _remote;

  @override
  Future<Result<HealthModel>> fetchHealth() {
    return runCatchingExceptions<HealthModel>(_remote.fetchHealth);
  }

  @override
  Future<Result<DeviceModel>> registerDevice({
    required String token,
    required String platform,
    required String quote,
  }) {
    return runCatchingExceptions<DeviceModel>(
      () => _remote.registerDevice(
        token: token,
        platform: platform,
        quote: quote,
      ),
    );
  }

  @override
  Future<Result<void>> unregisterDevice(String token) {
    return runCatchingExceptions<void>(() => _remote.unregisterDevice(token));
  }

  @override
  Future<Result<TestPushResultModel>> sendTest(String quote) {
    return runCatchingExceptions<TestPushResultModel>(
      () => _remote.sendTest(quote),
    );
  }
}
