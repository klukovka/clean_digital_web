// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../pages/administrator/admin_page.dart' as _i4;
import '../pages/administrator/tabs/admin_backups_tab/admin_backups_tab.dart'
    as _i9;
import '../pages/administrator/tabs/admin_clients_tab/admin_clients_tab.dart'
    as _i10;
import '../pages/administrator/tabs/admin_laundries_tab/admin_laundries_tab.dart'
    as _i8;
import '../pages/administrator/tabs/admin_repair_companies_tab/admin_repair_companies_tab.dart'
    as _i13;
import '../pages/administrator/tabs/admin_settings_tab/admin_settings_tab.dart'
    as _i12;
import '../pages/administrator/tabs/admin_statistic_tab/admin_statistic_tab.dart'
    as _i11;
import '../pages/auth/login_page.dart' as _i2;
import '../pages/auth/restore_password_page.dart' as _i3;
import '../pages/employee_main_page/employee_main_page.dart' as _i6;
import '../pages/laundry_main_page/laundry_main_page.dart' as _i5;
import '../pages/repair_company_main_page/repair_company_main_page.dart' as _i7;
import '../pages/splash_page/splash_page.dart' as _i1;

class AppAutoRouter extends _i14.RootStackRouter {
  AppAutoRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SplashPage(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.LoginPage(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    RestorePasswordRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.RestorePasswordPage(),
          fullscreenDialog: true,
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.AdminPage(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryMainRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.LaundryMainPage(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeMainRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.EmployeeMainPage(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    RepairCompanyMainRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.RepairCompanyMainPage(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminLaundriesRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.AdminLaundriesTab(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminBackupsRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.AdminBackupsTab(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminClientsRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i10.AdminClientsTab(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminStatisticRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i11.AdminStatisticTab(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminSettingsRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i12.AdminSettingsTab(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminRepairCompaniesRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i13.AdminRepairCompaniesTab(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig('/#redirect',
            path: '/', redirectTo: '/init', fullMatch: true),
        _i14.RouteConfig(SplashRoute.name, path: '/init'),
        _i14.RouteConfig(LoginRoute.name, path: '/auth/login'),
        _i14.RouteConfig(RestorePasswordRoute.name, path: '/auth/restore'),
        _i14.RouteConfig(AdminRoute.name, path: '/admin/', children: [
          _i14.RouteConfig('#redirect',
              path: '',
              parent: AdminRoute.name,
              redirectTo: 'laundries/',
              fullMatch: true),
          _i14.RouteConfig(AdminLaundriesRoute.name,
              path: 'laundries/', parent: AdminRoute.name),
          _i14.RouteConfig(AdminBackupsRoute.name,
              path: 'backups/', parent: AdminRoute.name),
          _i14.RouteConfig(AdminClientsRoute.name,
              path: 'clients/', parent: AdminRoute.name),
          _i14.RouteConfig(AdminStatisticRoute.name,
              path: 'statistic/', parent: AdminRoute.name),
          _i14.RouteConfig(AdminSettingsRoute.name,
              path: 'settings/', parent: AdminRoute.name),
          _i14.RouteConfig(AdminRepairCompaniesRoute.name,
              path: 'repairCompanies/', parent: AdminRoute.name)
        ]),
        _i14.RouteConfig(LaundryMainRoute.name, path: '/laundry/'),
        _i14.RouteConfig(EmployeeMainRoute.name, path: '/employee/'),
        _i14.RouteConfig(RepairCompanyMainRoute.name, path: '/repairCompany/')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/init');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/auth/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RestorePasswordPage]
class RestorePasswordRoute extends _i14.PageRouteInfo<void> {
  const RestorePasswordRoute()
      : super(RestorePasswordRoute.name, path: '/auth/restore');

  static const String name = 'RestorePasswordRoute';
}

/// generated route for
/// [_i4.AdminPage]
class AdminRoute extends _i14.PageRouteInfo<void> {
  const AdminRoute({List<_i14.PageRouteInfo>? children})
      : super(AdminRoute.name, path: '/admin/', initialChildren: children);

  static const String name = 'AdminRoute';
}

/// generated route for
/// [_i5.LaundryMainPage]
class LaundryMainRoute extends _i14.PageRouteInfo<void> {
  const LaundryMainRoute() : super(LaundryMainRoute.name, path: '/laundry/');

  static const String name = 'LaundryMainRoute';
}

/// generated route for
/// [_i6.EmployeeMainPage]
class EmployeeMainRoute extends _i14.PageRouteInfo<void> {
  const EmployeeMainRoute() : super(EmployeeMainRoute.name, path: '/employee/');

  static const String name = 'EmployeeMainRoute';
}

/// generated route for
/// [_i7.RepairCompanyMainPage]
class RepairCompanyMainRoute extends _i14.PageRouteInfo<void> {
  const RepairCompanyMainRoute()
      : super(RepairCompanyMainRoute.name, path: '/repairCompany/');

  static const String name = 'RepairCompanyMainRoute';
}

/// generated route for
/// [_i8.AdminLaundriesTab]
class AdminLaundriesRoute extends _i14.PageRouteInfo<void> {
  const AdminLaundriesRoute()
      : super(AdminLaundriesRoute.name, path: 'laundries/');

  static const String name = 'AdminLaundriesRoute';
}

/// generated route for
/// [_i9.AdminBackupsTab]
class AdminBackupsRoute extends _i14.PageRouteInfo<void> {
  const AdminBackupsRoute() : super(AdminBackupsRoute.name, path: 'backups/');

  static const String name = 'AdminBackupsRoute';
}

/// generated route for
/// [_i10.AdminClientsTab]
class AdminClientsRoute extends _i14.PageRouteInfo<void> {
  const AdminClientsRoute() : super(AdminClientsRoute.name, path: 'clients/');

  static const String name = 'AdminClientsRoute';
}

/// generated route for
/// [_i11.AdminStatisticTab]
class AdminStatisticRoute extends _i14.PageRouteInfo<void> {
  const AdminStatisticRoute()
      : super(AdminStatisticRoute.name, path: 'statistic/');

  static const String name = 'AdminStatisticRoute';
}

/// generated route for
/// [_i12.AdminSettingsTab]
class AdminSettingsRoute extends _i14.PageRouteInfo<void> {
  const AdminSettingsRoute()
      : super(AdminSettingsRoute.name, path: 'settings/');

  static const String name = 'AdminSettingsRoute';
}

/// generated route for
/// [_i13.AdminRepairCompaniesTab]
class AdminRepairCompaniesRoute extends _i14.PageRouteInfo<void> {
  const AdminRepairCompaniesRoute()
      : super(AdminRepairCompaniesRoute.name, path: 'repairCompanies/');

  static const String name = 'AdminRepairCompaniesRoute';
}
