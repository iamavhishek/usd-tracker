import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

import '../../core/config/app_env.dart';
import '../../core/network/dio_client.dart';
import '../../core/services/firebase_push_service.dart';
import '../../core/services/push_service.dart';
import '../../features/alerts/bloc/alerts_cubit.dart';
import '../../features/alerts/data/datasources/alerts_remote_datasource.dart';
import '../../features/alerts/repo/alerts_repo.dart';
import '../../features/alerts/repo/alerts_repo_impl.dart';
import '../../features/rates/bloc/rates_cubit.dart';
import '../../features/rates/data/datasources/rates_local_datasource.dart';
import '../../features/rates/data/datasources/rates_remote_datasource.dart';
import '../../features/rates/repo/rates_repo.dart';
import '../../features/rates/repo/rates_repo_impl.dart';
import '../../features/settings/bloc/settings_cubit.dart';
import '../../features/settings/data/datasources/settings_remote_datasource.dart';
import '../../features/settings/repo/settings_repo.dart';
import '../../features/settings/repo/settings_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies(AppEnv env, Box<String> cacheBox) {
  final DioClient dioClient = DioClient(
    baseUrl: env.baseUrl,
    apiKey: env.apiKey,
  );

  getIt
    ..registerSingleton<AppEnv>(env)
    ..registerSingleton<DioClient>(dioClient)
    ..registerLazySingleton<RatesRemoteDataSource>(
      () => RatesRemoteDataSourceImpl(dioClient.dio),
    )
    ..registerLazySingleton<RatesLocalDataSource>(
      () => RatesLocalDataSourceImpl(cacheBox),
    )
    ..registerLazySingleton<RatesRepo>(
      () => RatesRepoImpl(
        getIt<RatesRemoteDataSource>(),
        getIt<RatesLocalDataSource>(),
      ),
    )
    ..registerLazySingleton<AlertsRemoteDataSource>(
      () => AlertsRemoteDataSourceImpl(dioClient.dio),
    )
    ..registerLazySingleton<AlertsRepo>(
      () => AlertsRepoImpl(getIt<AlertsRemoteDataSource>()),
    )
    ..registerLazySingleton<SettingsRemoteDataSource>(
      () => SettingsRemoteDataSourceImpl(dioClient.dio),
    )
    ..registerLazySingleton<SettingsRepo>(
      () => SettingsRepoImpl(getIt<SettingsRemoteDataSource>()),
    )
    ..registerLazySingleton<PushService>(FirebasePushService.new)
    ..registerFactory<RatesCubit>(
      () => RatesCubit(getIt<RatesRepo>(), getIt<AppEnv>()),
    )
    ..registerFactory<AlertsCubit>(
      () =>
          AlertsCubit(getIt<AlertsRepo>(), getIt<RatesRepo>(), getIt<AppEnv>()),
    )
    ..registerFactory<SettingsCubit>(
      () => SettingsCubit(
        getIt<SettingsRepo>(),
        getIt<PushService>(),
        getIt<AppEnv>(),
      ),
    );
}
