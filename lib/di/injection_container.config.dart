// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/clean_digital_api_client.dart' as _i11;
import '../api/interceptors/header_api_interceptor.dart' as _i9;
import '../bloc/admin_page/admin_backups_tab/admin_backups_tab_cubit.dart'
    as _i18;
import '../bloc/admin_page/admin_laundres_tab/admin_laundres_tab_cubit.dart'
    as _i13;
import '../bloc/admin_page/admin_settings_tab/admin_settings_tab_cubit.dart'
    as _i19;
import '../bloc/app_control/app_control_cubit.dart' as _i8;
import '../bloc/auth/login_page/login_page_cubit.dart' as _i16;
import '../bloc/auth/restore_password_page/restore_password_page_cubit.dart'
    as _i17;
import '../bloc/splash_page/splash_page_cubit.dart' as _i6;
import '../router/app_auto_router.gr.dart' as _i4;
import '../router/clean_digital_router.dart' as _i3;
import '../services/auth_service.dart' as _i14;
import '../services/backup_service.dart' as _i15;
import '../services/laundries_service.dart' as _i12;
import '../services/logout_service.dart' as _i7;
import '../services/preferences_service.dart' as _i5;
import 'module/api_module.dart' as _i20; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i6.SplashPageCubit>(
      () => _i6.SplashPageCubit(get<_i5.PreferencesService>()));
  gh.factory<_i7.LogoutService>(() => _i7.LogoutService(
      get<_i5.PreferencesService>(), get<_i3.CleanDigitalRouter>()));
  gh.factoryParam<_i8.AppControlCubit, _i8.AppControlState?, dynamic>(
      (initialState, _) => _i8.AppControlCubit(get<_i5.PreferencesService>(),
          get<_i7.LogoutService>(), initialState));
  gh.factory<_i9.HeaderApiInterceptor>(() => _i9.HeaderApiInterceptor(
      get<_i5.PreferencesService>(), get<_i7.LogoutService>()));
  gh.lazySingleton<_i10.Dio>(
      () => apiModule.dio(get<_i9.HeaderApiInterceptor>()));
  gh.lazySingleton<_i11.CleanDigitalApiClient>(
      () => apiModule.apiClient(get<_i10.Dio>()));
  gh.factory<_i12.LaundriesService>(
      () => _i12.LaundriesService(get<_i11.CleanDigitalApiClient>()));
  gh.factory<_i13.AdminLaundriesTabCubit>(
      () => _i13.AdminLaundriesTabCubit(get<_i12.LaundriesService>()));
  gh.factory<_i14.AuthService>(
      () => _i14.AuthService(get<_i11.CleanDigitalApiClient>()));
  gh.factory<_i15.BackupService>(
      () => _i15.BackupService(get<_i11.CleanDigitalApiClient>()));
  gh.factory<_i16.LoginPageCubit>(() => _i16.LoginPageCubit(
      get<_i14.AuthService>(), get<_i5.PreferencesService>()));
  gh.factory<_i17.RestorePasswordPageCubit>(
      () => _i17.RestorePasswordPageCubit(get<_i14.AuthService>()));
  gh.factory<_i18.AdminBackupsTabCubit>(
      () => _i18.AdminBackupsTabCubit(get<_i15.BackupService>()));
  gh.factory<_i19.AdminSettingsTabCubit>(
      () => _i19.AdminSettingsTabCubit(get<_i14.AuthService>()));
  return get;
}

class _$ApiModule extends _i20.ApiModule {}
