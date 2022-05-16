// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/clean_digital_api_client.dart' as _i10;
import '../api/interceptors/header_api_interceptor.dart' as _i8;
import '../bloc/app_control/app_control_cubit.dart' as _i7;
import '../router/app_auto_router.gr.dart' as _i4;
import '../router/clean_digital_router.dart' as _i3;
import '../services/auth_service.dart' as _i11;
import '../services/logout_service.dart' as _i6;
import '../services/preferences_service.dart' as _i5;
import 'module/api_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.singleton<_i3.CleanDigitalRouter>(
      _i3.CleanDigitalRouter(get<_i4.AppAutoRouter>()));
  await gh.factoryAsync<_i5.PreferencesService>(
      () => _i5.PreferencesService.getInstance(),
      preResolve: true);
  gh.factory<_i6.LogoutService>(() => _i6.LogoutService(
      get<_i5.PreferencesService>(), get<_i3.CleanDigitalRouter>()));
  gh.factoryParam<_i7.AppControlCubit, _i7.AppControlState?, dynamic>(
      (initialState, _) => _i7.AppControlCubit(get<_i5.PreferencesService>(),
          get<_i6.LogoutService>(), initialState));
  gh.factory<_i8.HeaderApiInterceptor>(() => _i8.HeaderApiInterceptor(
      get<_i5.PreferencesService>(), get<_i6.LogoutService>()));
  gh.lazySingleton<_i9.Dio>(
      () => apiModule.dio(get<_i8.HeaderApiInterceptor>()));
  gh.lazySingleton<_i10.CleanDigitalApiClient>(
      () => apiModule.apiClient(get<_i9.Dio>()));
  gh.factory<_i11.AuthService>(
      () => _i11.AuthService(get<_i10.CleanDigitalApiClient>()));
  return get;
}

class _$ApiModule extends _i12.ApiModule {}
