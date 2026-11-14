import '../../../../core/errors/result.dart';
import '../data/models/settings_models.dart';

abstract class SettingsRepo {
  Future<Result<HealthModel>> fetchHealth();

  Future<Result<DeviceModel>> registerDevice({
    required String token,
    required String platform,
    required String quote,
  });

  Future<Result<void>> unregisterDevice(String token);

  Future<Result<TestPushResultModel>> sendTest(String quote);
}
