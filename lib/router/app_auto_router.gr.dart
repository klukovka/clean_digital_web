// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../pages/administrator/admin_laundry_page/admin_laundry_page.dart'
    as _i5;
import '../pages/administrator/admin_laundry_page/tabs/admin_employees_tab.dart'
    as _i16;
import '../pages/administrator/admin_laundry_page/tabs/admin_wash_machines_tab.dart'
    as _i15;
import '../pages/administrator/admin_page.dart' as _i4;
import '../pages/administrator/tabs/admin_backups_tab/admin_backups_tab.dart'
    as _i10;
import '../pages/administrator/tabs/admin_clients_tab/admin_clients_tab.dart'
    as _i11;
import '../pages/administrator/tabs/admin_laundries_tab/admin_laundries_tab.dart'
    as _i9;
import '../pages/administrator/tabs/admin_repair_companies_tab/admin_repair_companies_tab.dart'
    as _i14;
import '../pages/administrator/tabs/admin_settings_tab/admin_settings_tab.dart'
    as _i13;
import '../pages/administrator/tabs/admin_statistic_tab/admin_statistic_tab.dart'
    as _i12;
import '../pages/auth/login_page.dart' as _i2;
import '../pages/auth/restore_password_page.dart' as _i3;
import '../pages/employee_main_page/employee_main_page.dart' as _i7;
import '../pages/laundry_main_page/laundry_main_page.dart' as _i6;
import '../pages/repair_company_main_page/repair_company_main_page.dart' as _i8;
import '../pages/splash_page/splash_page.dart' as _i1;

class AppAutoRouter extends _i17.RootStackRouter {
  AppAutoRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SplashPage(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.LoginPage(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    RestorePasswordRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.RestorePasswordPage(),
          fullscreenDialog: true,
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.AdminPage(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminLaundryRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AdminLaundryRouteArgs>(
          orElse: () => AdminLaundryRouteArgs(
              laundryId: pathParams.getString('laundryId')));
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.AdminLaundryPage(key: args.key, laundryId: args.laundryId),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryMainRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.LaundryMainPage(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeMainRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.EmployeeMainPage(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    RepairCompanyMainRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.RepairCompanyMainPage(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminLaundriesRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.AdminLaundriesTab(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminBackupsRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i10.AdminBackupsTab(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminClientsRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i11.AdminClientsTab(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminStatisticRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i12.AdminStatisticTab(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminSettingsRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i13.AdminSettingsTab(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminRepairCompaniesRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i14.AdminRepairCompaniesTab(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminWashMachinesRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i15.AdminWashMachinesTab(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminEmployeesRoute.name: (routeData) {
      return _i17.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i16.AdminEmployeesTab(),
          transitionsBuilder: _i17.TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig('/#redirect',
            path: '/', redirectTo: '/init', fullMatch: true),
        _i17.RouteConfig(SplashRoute.name, path: '/init'),
        _i17.RouteConfig(LoginRoute.name, path: '/auth/login'),
        _i17.RouteConfig(RestorePasswordRoute.name, path: '/auth/restore'),
        _i17.RouteConfig(AdminRoute.name, path: '/admin/', children: [
          _i17.RouteConfig('#redirect',
              path: '',
              parent: AdminRoute.name,
              redirectTo: 'laundries/',
              fullMatch: true),
          _i17.RouteConfig(AdminLaundriesRoute.name,
              path: 'laundries/', parent: AdminRoute.name),
          _i17.RouteConfig(AdminBackupsRoute.name,
              path: 'backups/', parent: AdminRoute.name),
          _i17.RouteConfig(AdminClientsRoute.name,
              path: 'clients/', parent: AdminRoute.name),
          _i17.RouteConfig(AdminStatisticRoute.name,
              path: 'statistic/', parent: AdminRoute.name),
          _i17.RouteConfig(AdminSettingsRoute.name,
              path: 'settings/', parent: AdminRoute.name),
          _i17.RouteConfig(AdminRepairCompaniesRoute.name,
              path: 'repairCompanies/', parent: AdminRoute.name)
        ]),
        _i17.RouteConfig(AdminLaundryRoute.name,
            path: '/admin/laundries/:laundryId/',
            children: [
              _i17.RouteConfig('#redirect',
                  path: '',
                  parent: AdminLaundryRoute.name,
                  redirectTo: 'washMachines/',
                  fullMatch: true),
              _i17.RouteConfig(AdminWashMachinesRoute.name,
                  path: 'washMachines/', parent: AdminLaundryRoute.name),
              _i17.RouteConfig(AdminEmployeesRoute.name,
                  path: 'employees/', parent: AdminLaundryRoute.name)
            ]),
        _i17.RouteConfig(LaundryMainRoute.name, path: '/laundry/'),
        _i17.RouteConfig(EmployeeMainRoute.name, path: '/employee/'),
        _i17.RouteConfig(RepairCompanyMainRoute.name, path: '/repairCompany/')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i17.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/init');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/auth/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RestorePasswordPage]
class RestorePasswordRoute extends _i17.PageRouteInfo<void> {
  const RestorePasswordRoute()
      : super(RestorePasswordRoute.name, path: '/auth/restore');

  static const String name = 'RestorePasswordRoute';
}

/// generated route for
/// [_i4.AdminPage]
class AdminRoute extends _i17.PageRouteInfo<void> {
  const AdminRoute({List<_i17.PageRouteInfo>? children})
      : super(AdminRoute.name, path: '/admin/', initialChildren: children);

  static const String name = 'AdminRoute';
}

/// generated route for
/// [_i5.AdminLaundryPage]
class AdminLaundryRoute extends _i17.PageRouteInfo<AdminLaundryRouteArgs> {
  AdminLaundryRoute(
      {_i18.Key? key,
      required String laundryId,
      List<_i17.PageRouteInfo>? children})
      : super(AdminLaundryRoute.name,
            path: '/admin/laundries/:laundryId/',
            args: AdminLaundryRouteArgs(key: key, laundryId: laundryId),
            rawPathParams: {'laundryId': laundryId},
            initialChildren: children);

  static const String name = 'AdminLaundryRoute';
}

class AdminLaundryRouteArgs {
  const AdminLaundryRouteArgs({this.key, required this.laundryId});

  final _i18.Key? key;

  final String laundryId;

  @override
  String toString() {
    return 'AdminLaundryRouteArgs{key: $key, laundryId: $laundryId}';
  }
}

/// generated route for
/// [_i6.LaundryMainPage]
class LaundryMainRoute extends _i17.PageRouteInfo<void> {
  const LaundryMainRoute() : super(LaundryMainRoute.name, path: '/laundry/');

  static const String name = 'LaundryMainRoute';
}

/// generated route for
/// [_i7.EmployeeMainPage]
class EmployeeMainRoute extends _i17.PageRouteInfo<void> {
  const EmployeeMainRoute() : super(EmployeeMainRoute.name, path: '/employee/');

  static const String name = 'EmployeeMainRoute';
}

/// generated route for
/// [_i8.RepairCompanyMainPage]
class RepairCompanyMainRoute extends _i17.PageRouteInfo<void> {
  const RepairCompanyMainRoute()
      : super(RepairCompanyMainRoute.name, path: '/repairCompany/');

  static const String name = 'RepairCompanyMainRoute';
}

/// generated route for
/// [_i9.AdminLaundriesTab]
class AdminLaundriesRoute extends _i17.PageRouteInfo<void> {
  const AdminLaundriesRoute()
      : super(AdminLaundriesRoute.name, path: 'laundries/');

  static const String name = 'AdminLaundriesRoute';
}

/// generated route for
/// [_i10.AdminBackupsTab]
class AdminBackupsRoute extends _i17.PageRouteInfo<void> {
  const AdminBackupsRoute() : super(AdminBackupsRoute.name, path: 'backups/');

  static const String name = 'AdminBackupsRoute';
}

/// generated route for
/// [_i11.AdminClientsTab]
class AdminClientsRoute extends _i17.PageRouteInfo<void> {
  const AdminClientsRoute() : super(AdminClientsRoute.name, path: 'clients/');

  static const String name = 'AdminClientsRoute';
}

/// generated route for
/// [_i12.AdminStatisticTab]
class AdminStatisticRoute extends _i17.PageRouteInfo<void> {
  const AdminStatisticRoute()
      : super(AdminStatisticRoute.name, path: 'statistic/');

  static const String name = 'AdminStatisticRoute';
}

/// generated route for
/// [_i13.AdminSettingsTab]
class AdminSettingsRoute extends _i17.PageRouteInfo<void> {
  const AdminSettingsRoute()
      : super(AdminSettingsRoute.name, path: 'settings/');

  static const String name = 'AdminSettingsRoute';
}

/// generated route for
/// [_i14.AdminRepairCompaniesTab]
class AdminRepairCompaniesRoute extends _i17.PageRouteInfo<void> {
  const AdminRepairCompaniesRoute()
      : super(AdminRepairCompaniesRoute.name, path: 'repairCompanies/');

  static const String name = 'AdminRepairCompaniesRoute';
}

/// generated route for
/// [_i15.AdminWashMachinesTab]
class AdminWashMachinesRoute extends _i17.PageRouteInfo<void> {
  const AdminWashMachinesRoute()
      : super(AdminWashMachinesRoute.name, path: 'washMachines/');

  static const String name = 'AdminWashMachinesRoute';
}

/// generated route for
/// [_i16.AdminEmployeesTab]
class AdminEmployeesRoute extends _i17.PageRouteInfo<void> {
  const AdminEmployeesRoute()
      : super(AdminEmployeesRoute.name, path: 'employees/');

  static const String name = 'AdminEmployeesRoute';
}
