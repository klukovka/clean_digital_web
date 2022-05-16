// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/clean_digital_api_client.dart' as _i6;
import '../api/interceptors/header_api_interceptor.dart' as _i4;
import '../services/preferences_service.dart' as _i3;
import 'module/api_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  await gh.factoryAsync<_i3.PreferencesService>(
      () => _i3.PreferencesService.getInstance(),
      preResolve: true);
  gh.factory<_i4.HeaderApiInterceptor>(
      () => _i4.HeaderApiInterceptor(get<_i3.PreferencesService>()));
  gh.lazySingleton<_i5.Dio>(
      () => apiModule.dio(get<_i4.HeaderApiInterceptor>()));
  gh.lazySingleton<_i6.CleanDigitalApiClient>(
      () => apiModule.apiClient(get<_i5.Dio>()));
  return get;
}

class _$ApiModule extends _i7.ApiModule {}
