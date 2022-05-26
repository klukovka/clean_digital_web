// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/clean_digital_api_client.dart' as _i11;
import '../api/interceptors/header_api_interceptor.dart' as _i9;
import '../bloc/administrator/admin_laundry_page/admin_laundry_page_cubit.dart'
    as _i20;
import '../bloc/administrator/admin_laundry_page/tabs/admin_employees_tab/admin_employees_tab_cubit.dart'
    as _i31;
import '../bloc/administrator/admin_laundry_page/tabs/admin_wash_machines_tab/admin_wash_machines_tab_cubit.dart'
    as _i23;
import '../bloc/administrator/tabs/admin_backups_tab/admin_backups_tab_cubit.dart'
    as _i29;
import '../bloc/administrator/tabs/admin_clients_tab/admin_clients_tab_cubit.dart'
    as _i30;
import '../bloc/administrator/tabs/admin_laundries_tab/admin_laundries_tab_cubit.dart'
    as _i32;
import '../bloc/administrator/tabs/admin_repair_companies_tab/admin_repair_companies_tab_cubit.dart'
    as _i33;
import '../bloc/administrator/tabs/admin_repair_companies_tab/admin_repair_product_view/admin_repair_product_view_cubit.dart'
    as _i21;
import '../bloc/administrator/tabs/admin_settings_tab/admin_settings_tab_cubit.dart'
    as _i34;
import '../bloc/administrator/tabs/admin_statistic_tab/admin_statistic_tab_cubit.dart'
    as _i22;
import '../bloc/app_control/app_control_cubit.dart' as _i8;
import '../bloc/auth/login_page/login_page_cubit.dart' as _i27;
import '../bloc/auth/restore_password_page/restore_password_page_cubit.dart'
    as _i28;
import '../bloc/laundry_employee/laundry_employee_statistic/laundry_employee_statistic_tab_cubit.dart'
    as _i26;
import '../bloc/laundry_employee/tabs/laundry_employee_modes/additional_modes_tab/additional_modes_tab_cubit.dart'
    as _i19;
import '../bloc/laundry_employee/tabs/laundry_employee_modes/mode_tab/mode_tab_cubit.dart'
    as _i16;
import '../bloc/laundry_employee/tabs/laundry_employee_wash_machines_tab/laundry_employee_wash_machines_tab_cubit.dart'
    as _i14;
import '../bloc/laundry_employee/tabs/laundry_employees_tab/laundry_employees_tab_cubit.dart'
    as _i15;
import '../bloc/splash_page/splash_page_cubit.dart' as _i6;
import '../router/app_auto_router.gr.dart' as _i4;
import '../router/clean_digital_router.dart' as _i3;
import '../services/auth_service.dart' as _i24;
import '../services/backup_service.dart' as _i25;
import '../services/clients_service.dart' as _i12;
import '../services/laundries_service.dart' as _i13;
import '../services/logout_service.dart' as _i7;
import '../services/preferences_service.dart' as _i5;
import '../services/repair_companies_service.dart' as _i17;
import '../services/statistic_service.dart' as _i18;
import 'module/api_module.dart' as _i35; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i12.ClientsService>(
      () => _i12.ClientsService(get<_i11.CleanDigitalApiClient>()));
  gh.factory<_i13.LaundriesService>(
      () => _i13.LaundriesService(get<_i11.CleanDigitalApiClient>()));
  gh.factory<_i14.LaundryEmployeeWashMachinesTabCubit>(() =>
      _i14.LaundryEmployeeWashMachinesTabCubit(get<_i13.LaundriesService>()));
  gh.factory<_i15.LaundryEmployeesTabCubit>(
      () => _i15.LaundryEmployeesTabCubit(get<_i13.LaundriesService>()));
  gh.factory<_i16.ModesTabCubit>(
      () => _i16.ModesTabCubit(get<_i13.LaundriesService>()));
  gh.factory<_i17.RepairCompaniesService>(
      () => _i17.RepairCompaniesService(get<_i11.CleanDigitalApiClient>()));
  gh.factory<_i18.StatisticService>(
      () => _i18.StatisticService(get<_i11.CleanDigitalApiClient>()));
  gh.factory<_i19.AdditionalModesTabCubit>(
      () => _i19.AdditionalModesTabCubit(get<_i13.LaundriesService>()));
  gh.factoryParam<_i20.AdminLaundryPageCubit, String?, dynamic>(
      (laundryId, _) =>
          _i20.AdminLaundryPageCubit(get<_i13.LaundriesService>(), laundryId));
  gh.factoryParam<_i21.AdminRepairProductsViewCubit, String?, dynamic>(
      (companyId, _) => _i21.AdminRepairProductsViewCubit(
          get<_i17.RepairCompaniesService>(), companyId));
  gh.factory<_i22.AdminStatisticTabCubit>(
      () => _i22.AdminStatisticTabCubit(get<_i18.StatisticService>()));
  gh.factoryParam<_i23.AdminWashMachinesTabCubit, String?, dynamic>((laundryId,
          _) =>
      _i23.AdminWashMachinesTabCubit(get<_i13.LaundriesService>(), laundryId));
  gh.factory<_i24.AuthService>(
      () => _i24.AuthService(get<_i11.CleanDigitalApiClient>()));
  gh.factory<_i25.BackupService>(
      () => _i25.BackupService(get<_i11.CleanDigitalApiClient>()));
  gh.factory<_i26.LaundryEmployeeStatisticTabCubit>(() =>
      _i26.LaundryEmployeeStatisticTabCubit(get<_i18.StatisticService>()));
  gh.factory<_i27.LoginPageCubit>(() => _i27.LoginPageCubit(
      get<_i24.AuthService>(), get<_i5.PreferencesService>()));
  gh.factory<_i28.RestorePasswordPageCubit>(
      () => _i28.RestorePasswordPageCubit(get<_i24.AuthService>()));
  gh.factory<_i29.AdminBackupsTabCubit>(
      () => _i29.AdminBackupsTabCubit(get<_i25.BackupService>()));
  gh.factory<_i30.AdminClientsTabCubit>(() => _i30.AdminClientsTabCubit(
      get<_i12.ClientsService>(), get<_i24.AuthService>()));
  gh.factoryParam<_i31.AdminEmployeesTabCubit, String?, dynamic>(
      (laundryId, _) => _i31.AdminEmployeesTabCubit(
          get<_i13.LaundriesService>(), get<_i24.AuthService>(), laundryId));
  gh.factory<_i32.AdminLaundriesTabCubit>(() => _i32.AdminLaundriesTabCubit(
      get<_i13.LaundriesService>(), get<_i24.AuthService>()));
  gh.factory<_i33.AdminRepairCompaniesTabCubit>(() =>
      _i33.AdminRepairCompaniesTabCubit(
          get<_i17.RepairCompaniesService>(), get<_i24.AuthService>()));
  gh.factory<_i34.AdminSettingsTabCubit>(
      () => _i34.AdminSettingsTabCubit(get<_i24.AuthService>()));
  return get;
}

class _$ApiModule extends _i35.ApiModule {}
