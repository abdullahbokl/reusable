// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/home/data/data_sources/home_datasource.dart' as _i877;
import '../../../features/home/data/repositories/home_repo_impl.dart' as _i120;
import '../../../features/home/domain/repositories/home_repo.dart' as _i397;
import '../../../features/home/domain/use_cases/get_products_use_case.dart'
    as _i631;
import '../../../features/home/presentation/manager/home_cubit.dart' as _i682;
import '../api/api_services.dart' as _i124;
import '../api/dio/dio_consumer.dart' as _i402;
import '../cache_services/cache_services.dart' as _i74;
import '../cache_services/prefs_consumer.dart' as _i818;
import '../cache_services/secure_storage_consumer.dart' as _i178;
import 'service_locator.dart' as _i105;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singletonAsync<_i460.SharedPreferences>(() => appModule.sharedPreferences);
  gh.singleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
  gh.singleton<_i974.Logger>(() => appModule.logger);
  gh.lazySingleton<_i361.Dio>(() => appModule.dio);
  gh.lazySingleton<_i74.CacheServices>(
    () => _i178.SecureStorageConsumer(gh<_i558.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingletonAsync<_i74.CacheServices>(() async =>
      _i818.PrefsConsumer(await gh.getAsync<_i460.SharedPreferences>()));
  gh.lazySingleton<_i124.ApiServices>(() => _i402.DioConsumer(gh<_i361.Dio>()));
  gh.lazySingleton<_i877.HomeDatasource>(
      () => _i877.HomeDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i397.HomeRepo>(
      () => _i120.HomeRepoImpl(gh<_i877.HomeDatasource>()));
  gh.lazySingleton<_i631.GetProductsUsecase>(
      () => _i631.GetProductsUsecase(gh<_i397.HomeRepo>()));
  gh.factory<_i682.HomeCubit>(
      () => _i682.HomeCubit(gh<_i631.GetProductsUsecase>()));
  return getIt;
}

class _$AppModule extends _i105.AppModule {}
