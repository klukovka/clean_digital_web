// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i29;
import 'package:flutter/material.dart' as _i30;

import '../models/repair_product.dart' as _i31;
import '../models/wash_machine.dart' as _i32;
import '../pages/administrator/admin_laundry_page/admin_laundry_page.dart'
    as _i5;
import '../pages/administrator/admin_laundry_page/tabs/admin_employees_tab.dart'
    as _i18;
import '../pages/administrator/admin_laundry_page/tabs/admin_wash_machines_tab.dart'
    as _i17;
import '../pages/administrator/admin_page.dart' as _i4;
import '../pages/administrator/tabs/admin_backups_tab/admin_backups_tab.dart'
    as _i12;
import '../pages/administrator/tabs/admin_clients_tab/admin_clients_tab.dart'
    as _i13;
import '../pages/administrator/tabs/admin_laundries_tab/admin_laundries_tab.dart'
    as _i11;
import '../pages/administrator/tabs/admin_repair_companies_tab/admin_repair_companies_tab.dart'
    as _i16;
import '../pages/administrator/tabs/admin_settings_tab/admin_settings_tab.dart'
    as _i15;
import '../pages/administrator/tabs/admin_statistic_tab/admin_statistic_tab.dart'
    as _i14;
import '../pages/auth/login_page.dart' as _i2;
import '../pages/auth/restore_password_page.dart' as _i3;
import '../pages/laundry_employee/choose_wash_machines_page.dart' as _i9;
import '../pages/laundry_employee/employee_page.dart' as _i7;
import '../pages/laundry_employee/laundry_employee_repair_products_page.dart'
    as _i8;
import '../pages/laundry_employee/laundry_page.dart' as _i6;
import '../pages/laundry_employee/tabs/employee_settings_tab.dart' as _i28;
import '../pages/laundry_employee/tabs/laundry_employee_events_tab.dart'
    as _i21;
import '../pages/laundry_employee/tabs/laundry_employee_modes/additional_mode_tab.dart'
    as _i27;
import '../pages/laundry_employee/tabs/laundry_employee_modes/laundry_employee_modes_tab.dart'
    as _i22;
import '../pages/laundry_employee/tabs/laundry_employee_modes/modes_tab.dart'
    as _i26;
import '../pages/laundry_employee/tabs/laundry_employee_repair_events_tab.dart'
    as _i23;
import '../pages/laundry_employee/tabs/laundry_employee_statistic.dart' as _i24;
import '../pages/laundry_employee/tabs/laundry_employee_wash_machines_tab.dart'
    as _i19;
import '../pages/laundry_employee/tabs/laundry_employees_tab.dart' as _i20;
import '../pages/laundry_employee/tabs/laundry_settings_tab.dart' as _i25;
import '../pages/repair_company_main_page/repair_company_main_page.dart'
    as _i10;
import '../pages/splash_page/splash_page.dart' as _i1;

class AppAutoRouter extends _i29.RootStackRouter {
  AppAutoRouter([_i30.GlobalKey<_i30.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i29.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SplashPage(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.LoginPage(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    RestorePasswordRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.RestorePasswordPage(),
          fullscreenDialog: true,
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.AdminPage(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminLaundryRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AdminLaundryRouteArgs>(
          orElse: () => AdminLaundryRouteArgs(
              laundryId: pathParams.getString('laundryId')));
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.AdminLaundryPage(key: args.key, laundryId: args.laundryId),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.LaundryPage(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.EmployeePage(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryEmployeeRepairProductsRoute.name: (routeData) {
      final args = routeData.argsAs<LaundryEmployeeRepairProductsRouteArgs>();
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.LaundryEmployeeRepairProductsPage(
              key: args.key, onChosen: args.onChosen),
          fullscreenDialog: true,
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ChooseWashMachinesRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseWashMachinesRouteArgs>();
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.ChooseWashMachinesPage(
              key: args.key, onChosen: args.onChosen),
          fullscreenDialog: true,
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    RepairCompanyMainRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i10.RepairCompanyMainPage(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminLaundriesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i11.AdminLaundriesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminBackupsRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i12.AdminBackupsTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminClientsRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i13.AdminClientsTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminStatisticRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i14.AdminStatisticTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminSettingsRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i15.AdminSettingsTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminRepairCompaniesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i16.AdminRepairCompaniesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminWashMachinesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i17.AdminWashMachinesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminEmployeesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i18.AdminEmployeesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryWashMachinesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i19.LaundryEmployeeWashMachinesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryEmployeesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i20.LaundryEmployeesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryEventsRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i21.LaundryEmployeeEventsTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryAllModesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i22.LaundryEmployeeAllModesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryRepairEventsRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i23.LaundryEmployeeRepairEventsTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryStatisticRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i24.LaundryEmployeeStatisticTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundrySettingsRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i25.LaundrySettingsTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ModesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i26.ModesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdditionalModesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i27.AdditionalModesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeWashMachinesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i19.LaundryEmployeeWashMachinesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeEventsRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i21.LaundryEmployeeEventsTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeAllModesRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i22.LaundryEmployeeAllModesTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeRepairEventsRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i23.LaundryEmployeeRepairEventsTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeStatisticRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i24.LaundryEmployeeStatisticTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeSettingsRoute.name: (routeData) {
      return _i29.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i28.EmployeeSettingsTab(),
          transitionsBuilder: _i29.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i29.RouteConfig> get routes => [
        _i29.RouteConfig('/#redirect',
            path: '/', redirectTo: '/init', fullMatch: true),
        _i29.RouteConfig(SplashRoute.name, path: '/init'),
        _i29.RouteConfig(LoginRoute.name, path: '/auth/login'),
        _i29.RouteConfig(RestorePasswordRoute.name, path: '/auth/restore'),
        _i29.RouteConfig(AdminRoute.name, path: '/admin/', children: [
          _i29.RouteConfig('#redirect',
              path: '',
              parent: AdminRoute.name,
              redirectTo: 'laundries/',
              fullMatch: true),
          _i29.RouteConfig(AdminLaundriesRoute.name,
              path: 'laundries/', parent: AdminRoute.name),
          _i29.RouteConfig(AdminBackupsRoute.name,
              path: 'backups/', parent: AdminRoute.name),
          _i29.RouteConfig(AdminClientsRoute.name,
              path: 'clients/', parent: AdminRoute.name),
          _i29.RouteConfig(AdminStatisticRoute.name,
              path: 'statistic/', parent: AdminRoute.name),
          _i29.RouteConfig(AdminSettingsRoute.name,
              path: 'settings/', parent: AdminRoute.name),
          _i29.RouteConfig(AdminRepairCompaniesRoute.name,
              path: 'repairCompanies/', parent: AdminRoute.name)
        ]),
        _i29.RouteConfig(AdminLaundryRoute.name,
            path: '/admin/laundries/:laundryId/',
            children: [
              _i29.RouteConfig('#redirect',
                  path: '',
                  parent: AdminLaundryRoute.name,
                  redirectTo: 'washMachines/',
                  fullMatch: true),
              _i29.RouteConfig(AdminWashMachinesRoute.name,
                  path: 'washMachines/', parent: AdminLaundryRoute.name),
              _i29.RouteConfig(AdminEmployeesRoute.name,
                  path: 'employees/', parent: AdminLaundryRoute.name)
            ]),
        _i29.RouteConfig(LaundryRoute.name, path: '/laundry/', children: [
          _i29.RouteConfig('#redirect',
              path: '',
              parent: LaundryRoute.name,
              redirectTo: 'washingMachines/',
              fullMatch: true),
          _i29.RouteConfig(LaundryWashMachinesRoute.name,
              path: 'washingMachines/', parent: LaundryRoute.name),
          _i29.RouteConfig(LaundryEmployeesRoute.name,
              path: 'employees/', parent: LaundryRoute.name),
          _i29.RouteConfig(LaundryEventsRoute.name,
              path: 'events/', parent: LaundryRoute.name),
          _i29.RouteConfig(LaundryAllModesRoute.name,
              path: 'allModes/',
              parent: LaundryRoute.name,
              children: [
                _i29.RouteConfig('#redirect',
                    path: '',
                    parent: LaundryAllModesRoute.name,
                    redirectTo: 'modes/',
                    fullMatch: true),
                _i29.RouteConfig(ModesRoute.name,
                    path: 'modes/', parent: LaundryAllModesRoute.name),
                _i29.RouteConfig(AdditionalModesRoute.name,
                    path: 'additionalModes/', parent: LaundryAllModesRoute.name)
              ]),
          _i29.RouteConfig(LaundryRepairEventsRoute.name,
              path: 'repairEvents/', parent: LaundryRoute.name),
          _i29.RouteConfig(LaundryStatisticRoute.name,
              path: 'statistic/', parent: LaundryRoute.name),
          _i29.RouteConfig(LaundrySettingsRoute.name,
              path: 'settings/', parent: LaundryRoute.name)
        ]),
        _i29.RouteConfig(EmployeeRoute.name, path: '/employee/', children: [
          _i29.RouteConfig('#redirect',
              path: '',
              parent: EmployeeRoute.name,
              redirectTo: 'washingMachines/',
              fullMatch: true),
          _i29.RouteConfig(EmployeeWashMachinesRoute.name,
              path: 'washingMachines/', parent: EmployeeRoute.name),
          _i29.RouteConfig(EmployeeEventsRoute.name,
              path: 'events/', parent: EmployeeRoute.name),
          _i29.RouteConfig(EmployeeAllModesRoute.name,
              path: 'allModes/',
              parent: EmployeeRoute.name,
              children: [
                _i29.RouteConfig('#redirect',
                    path: '',
                    parent: EmployeeAllModesRoute.name,
                    redirectTo: 'modes/',
                    fullMatch: true),
                _i29.RouteConfig(ModesRoute.name,
                    path: 'modes/', parent: EmployeeAllModesRoute.name),
                _i29.RouteConfig(AdditionalModesRoute.name,
                    path: 'additionalModes/',
                    parent: EmployeeAllModesRoute.name)
              ]),
          _i29.RouteConfig(EmployeeRepairEventsRoute.name,
              path: 'repairEvents/', parent: EmployeeRoute.name),
          _i29.RouteConfig(EmployeeStatisticRoute.name,
              path: 'statistic/', parent: EmployeeRoute.name),
          _i29.RouteConfig(EmployeeSettingsRoute.name,
              path: 'settings/', parent: EmployeeRoute.name)
        ]),
        _i29.RouteConfig(LaundryEmployeeRepairProductsRoute.name,
            path: '/chooseRepairProducts/'),
        _i29.RouteConfig(ChooseWashMachinesRoute.name,
            path: '/chooseWashMachines/'),
        _i29.RouteConfig(RepairCompanyMainRoute.name, path: '/repairCompany/')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i29.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/init');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i29.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/auth/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RestorePasswordPage]
class RestorePasswordRoute extends _i29.PageRouteInfo<void> {
  const RestorePasswordRoute()
      : super(RestorePasswordRoute.name, path: '/auth/restore');

  static const String name = 'RestorePasswordRoute';
}

/// generated route for
/// [_i4.AdminPage]
class AdminRoute extends _i29.PageRouteInfo<void> {
  const AdminRoute({List<_i29.PageRouteInfo>? children})
      : super(AdminRoute.name, path: '/admin/', initialChildren: children);

  static const String name = 'AdminRoute';
}

/// generated route for
/// [_i5.AdminLaundryPage]
class AdminLaundryRoute extends _i29.PageRouteInfo<AdminLaundryRouteArgs> {
  AdminLaundryRoute(
      {_i30.Key? key,
      required String laundryId,
      List<_i29.PageRouteInfo>? children})
      : super(AdminLaundryRoute.name,
            path: '/admin/laundries/:laundryId/',
            args: AdminLaundryRouteArgs(key: key, laundryId: laundryId),
            rawPathParams: {'laundryId': laundryId},
            initialChildren: children);

  static const String name = 'AdminLaundryRoute';
}

class AdminLaundryRouteArgs {
  const AdminLaundryRouteArgs({this.key, required this.laundryId});

  final _i30.Key? key;

  final String laundryId;

  @override
  String toString() {
    return 'AdminLaundryRouteArgs{key: $key, laundryId: $laundryId}';
  }
}

/// generated route for
/// [_i6.LaundryPage]
class LaundryRoute extends _i29.PageRouteInfo<void> {
  const LaundryRoute({List<_i29.PageRouteInfo>? children})
      : super(LaundryRoute.name, path: '/laundry/', initialChildren: children);

  static const String name = 'LaundryRoute';
}

/// generated route for
/// [_i7.EmployeePage]
class EmployeeRoute extends _i29.PageRouteInfo<void> {
  const EmployeeRoute({List<_i29.PageRouteInfo>? children})
      : super(EmployeeRoute.name,
            path: '/employee/', initialChildren: children);

  static const String name = 'EmployeeRoute';
}

/// generated route for
/// [_i8.LaundryEmployeeRepairProductsPage]
class LaundryEmployeeRepairProductsRoute
    extends _i29.PageRouteInfo<LaundryEmployeeRepairProductsRouteArgs> {
  LaundryEmployeeRepairProductsRoute(
      {_i30.Key? key, required void Function(_i31.RepairProduct) onChosen})
      : super(LaundryEmployeeRepairProductsRoute.name,
            path: '/chooseRepairProducts/',
            args: LaundryEmployeeRepairProductsRouteArgs(
                key: key, onChosen: onChosen));

  static const String name = 'LaundryEmployeeRepairProductsRoute';
}

class LaundryEmployeeRepairProductsRouteArgs {
  const LaundryEmployeeRepairProductsRouteArgs(
      {this.key, required this.onChosen});

  final _i30.Key? key;

  final void Function(_i31.RepairProduct) onChosen;

  @override
  String toString() {
    return 'LaundryEmployeeRepairProductsRouteArgs{key: $key, onChosen: $onChosen}';
  }
}

/// generated route for
/// [_i9.ChooseWashMachinesPage]
class ChooseWashMachinesRoute
    extends _i29.PageRouteInfo<ChooseWashMachinesRouteArgs> {
  ChooseWashMachinesRoute(
      {_i30.Key? key, required void Function(_i32.WashMachine) onChosen})
      : super(ChooseWashMachinesRoute.name,
            path: '/chooseWashMachines/',
            args: ChooseWashMachinesRouteArgs(key: key, onChosen: onChosen));

  static const String name = 'ChooseWashMachinesRoute';
}

class ChooseWashMachinesRouteArgs {
  const ChooseWashMachinesRouteArgs({this.key, required this.onChosen});

  final _i30.Key? key;

  final void Function(_i32.WashMachine) onChosen;

  @override
  String toString() {
    return 'ChooseWashMachinesRouteArgs{key: $key, onChosen: $onChosen}';
  }
}

/// generated route for
/// [_i10.RepairCompanyMainPage]
class RepairCompanyMainRoute extends _i29.PageRouteInfo<void> {
  const RepairCompanyMainRoute()
      : super(RepairCompanyMainRoute.name, path: '/repairCompany/');

  static const String name = 'RepairCompanyMainRoute';
}

/// generated route for
/// [_i11.AdminLaundriesTab]
class AdminLaundriesRoute extends _i29.PageRouteInfo<void> {
  const AdminLaundriesRoute()
      : super(AdminLaundriesRoute.name, path: 'laundries/');

  static const String name = 'AdminLaundriesRoute';
}

/// generated route for
/// [_i12.AdminBackupsTab]
class AdminBackupsRoute extends _i29.PageRouteInfo<void> {
  const AdminBackupsRoute() : super(AdminBackupsRoute.name, path: 'backups/');

  static const String name = 'AdminBackupsRoute';
}

/// generated route for
/// [_i13.AdminClientsTab]
class AdminClientsRoute extends _i29.PageRouteInfo<void> {
  const AdminClientsRoute() : super(AdminClientsRoute.name, path: 'clients/');

  static const String name = 'AdminClientsRoute';
}

/// generated route for
/// [_i14.AdminStatisticTab]
class AdminStatisticRoute extends _i29.PageRouteInfo<void> {
  const AdminStatisticRoute()
      : super(AdminStatisticRoute.name, path: 'statistic/');

  static const String name = 'AdminStatisticRoute';
}

/// generated route for
/// [_i15.AdminSettingsTab]
class AdminSettingsRoute extends _i29.PageRouteInfo<void> {
  const AdminSettingsRoute()
      : super(AdminSettingsRoute.name, path: 'settings/');

  static const String name = 'AdminSettingsRoute';
}

/// generated route for
/// [_i16.AdminRepairCompaniesTab]
class AdminRepairCompaniesRoute extends _i29.PageRouteInfo<void> {
  const AdminRepairCompaniesRoute()
      : super(AdminRepairCompaniesRoute.name, path: 'repairCompanies/');

  static const String name = 'AdminRepairCompaniesRoute';
}

/// generated route for
/// [_i17.AdminWashMachinesTab]
class AdminWashMachinesRoute extends _i29.PageRouteInfo<void> {
  const AdminWashMachinesRoute()
      : super(AdminWashMachinesRoute.name, path: 'washMachines/');

  static const String name = 'AdminWashMachinesRoute';
}

/// generated route for
/// [_i18.AdminEmployeesTab]
class AdminEmployeesRoute extends _i29.PageRouteInfo<void> {
  const AdminEmployeesRoute()
      : super(AdminEmployeesRoute.name, path: 'employees/');

  static const String name = 'AdminEmployeesRoute';
}

/// generated route for
/// [_i19.LaundryEmployeeWashMachinesTab]
class LaundryWashMachinesRoute extends _i29.PageRouteInfo<void> {
  const LaundryWashMachinesRoute()
      : super(LaundryWashMachinesRoute.name, path: 'washingMachines/');

  static const String name = 'LaundryWashMachinesRoute';
}

/// generated route for
/// [_i20.LaundryEmployeesTab]
class LaundryEmployeesRoute extends _i29.PageRouteInfo<void> {
  const LaundryEmployeesRoute()
      : super(LaundryEmployeesRoute.name, path: 'employees/');

  static const String name = 'LaundryEmployeesRoute';
}

/// generated route for
/// [_i21.LaundryEmployeeEventsTab]
class LaundryEventsRoute extends _i29.PageRouteInfo<void> {
  const LaundryEventsRoute() : super(LaundryEventsRoute.name, path: 'events/');

  static const String name = 'LaundryEventsRoute';
}

/// generated route for
/// [_i22.LaundryEmployeeAllModesTab]
class LaundryAllModesRoute extends _i29.PageRouteInfo<void> {
  const LaundryAllModesRoute({List<_i29.PageRouteInfo>? children})
      : super(LaundryAllModesRoute.name,
            path: 'allModes/', initialChildren: children);

  static const String name = 'LaundryAllModesRoute';
}

/// generated route for
/// [_i23.LaundryEmployeeRepairEventsTab]
class LaundryRepairEventsRoute extends _i29.PageRouteInfo<void> {
  const LaundryRepairEventsRoute()
      : super(LaundryRepairEventsRoute.name, path: 'repairEvents/');

  static const String name = 'LaundryRepairEventsRoute';
}

/// generated route for
/// [_i24.LaundryEmployeeStatisticTab]
class LaundryStatisticRoute extends _i29.PageRouteInfo<void> {
  const LaundryStatisticRoute()
      : super(LaundryStatisticRoute.name, path: 'statistic/');

  static const String name = 'LaundryStatisticRoute';
}

/// generated route for
/// [_i25.LaundrySettingsTab]
class LaundrySettingsRoute extends _i29.PageRouteInfo<void> {
  const LaundrySettingsRoute()
      : super(LaundrySettingsRoute.name, path: 'settings/');

  static const String name = 'LaundrySettingsRoute';
}

/// generated route for
/// [_i26.ModesTab]
class ModesRoute extends _i29.PageRouteInfo<void> {
  const ModesRoute() : super(ModesRoute.name, path: 'modes/');

  static const String name = 'ModesRoute';
}

/// generated route for
/// [_i27.AdditionalModesTab]
class AdditionalModesRoute extends _i29.PageRouteInfo<void> {
  const AdditionalModesRoute()
      : super(AdditionalModesRoute.name, path: 'additionalModes/');

  static const String name = 'AdditionalModesRoute';
}

/// generated route for
/// [_i19.LaundryEmployeeWashMachinesTab]
class EmployeeWashMachinesRoute extends _i29.PageRouteInfo<void> {
  const EmployeeWashMachinesRoute()
      : super(EmployeeWashMachinesRoute.name, path: 'washingMachines/');

  static const String name = 'EmployeeWashMachinesRoute';
}

/// generated route for
/// [_i21.LaundryEmployeeEventsTab]
class EmployeeEventsRoute extends _i29.PageRouteInfo<void> {
  const EmployeeEventsRoute()
      : super(EmployeeEventsRoute.name, path: 'events/');

  static const String name = 'EmployeeEventsRoute';
}

/// generated route for
/// [_i22.LaundryEmployeeAllModesTab]
class EmployeeAllModesRoute extends _i29.PageRouteInfo<void> {
  const EmployeeAllModesRoute({List<_i29.PageRouteInfo>? children})
      : super(EmployeeAllModesRoute.name,
            path: 'allModes/', initialChildren: children);

  static const String name = 'EmployeeAllModesRoute';
}

/// generated route for
/// [_i23.LaundryEmployeeRepairEventsTab]
class EmployeeRepairEventsRoute extends _i29.PageRouteInfo<void> {
  const EmployeeRepairEventsRoute()
      : super(EmployeeRepairEventsRoute.name, path: 'repairEvents/');

  static const String name = 'EmployeeRepairEventsRoute';
}

/// generated route for
/// [_i24.LaundryEmployeeStatisticTab]
class EmployeeStatisticRoute extends _i29.PageRouteInfo<void> {
  const EmployeeStatisticRoute()
      : super(EmployeeStatisticRoute.name, path: 'statistic/');

  static const String name = 'EmployeeStatisticRoute';
}

/// generated route for
/// [_i28.EmployeeSettingsTab]
class EmployeeSettingsRoute extends _i29.PageRouteInfo<void> {
  const EmployeeSettingsRoute()
      : super(EmployeeSettingsRoute.name, path: 'settings/');

  static const String name = 'EmployeeSettingsRoute';
}
