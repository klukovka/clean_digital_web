// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../pages/admin_main_page/admin_main_page.dart' as _i4;
import '../pages/auth/login_page.dart' as _i2;
import '../pages/auth/restore_password_page.dart' as _i3;
import '../pages/employee_main_page/employee_main_page.dart' as _i6;
import '../pages/laundry_main_page/laundry_main_page.dart' as _i5;
import '../pages/repair_company_main_page/repair_company_main_page.dart' as _i7;
import '../pages/splash_page/splash_page.dart' as _i1;

class AppAutoRouter extends _i8.RootStackRouter {
  AppAutoRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SplashPage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.LoginPage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    RestorePasswordRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.RestorePasswordPage(),
          fullscreenDialog: true,
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    AdminMainRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.AdminMainPage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    LaundryMainRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.LaundryMainPage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    EmployeeMainRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.EmployeeMainPage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    RepairCompanyMainRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.RepairCompanyMainPage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: '/init', fullMatch: true),
        _i8.RouteConfig(SplashRoute.name, path: '/init'),
        _i8.RouteConfig(LoginRoute.name, path: '/auth/login'),
        _i8.RouteConfig(RestorePasswordRoute.name, path: '/auth/restore'),
        _i8.RouteConfig(AdminMainRoute.name, path: '/admin/'),
        _i8.RouteConfig(LaundryMainRoute.name, path: '/laundry/'),
        _i8.RouteConfig(EmployeeMainRoute.name, path: '/employee/'),
        _i8.RouteConfig(RepairCompanyMainRoute.name, path: '/repairCompany/')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/init');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/auth/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RestorePasswordPage]
class RestorePasswordRoute extends _i8.PageRouteInfo<void> {
  const RestorePasswordRoute()
      : super(RestorePasswordRoute.name, path: '/auth/restore');

  static const String name = 'RestorePasswordRoute';
}

/// generated route for
/// [_i4.AdminMainPage]
class AdminMainRoute extends _i8.PageRouteInfo<void> {
  const AdminMainRoute() : super(AdminMainRoute.name, path: '/admin/');

  static const String name = 'AdminMainRoute';
}

/// generated route for
/// [_i5.LaundryMainPage]
class LaundryMainRoute extends _i8.PageRouteInfo<void> {
  const LaundryMainRoute() : super(LaundryMainRoute.name, path: '/laundry/');

  static const String name = 'LaundryMainRoute';
}

/// generated route for
/// [_i6.EmployeeMainPage]
class EmployeeMainRoute extends _i8.PageRouteInfo<void> {
  const EmployeeMainRoute() : super(EmployeeMainRoute.name, path: '/employee/');

  static const String name = 'EmployeeMainRoute';
}

/// generated route for
/// [_i7.RepairCompanyMainPage]
class RepairCompanyMainRoute extends _i8.PageRouteInfo<void> {
  const RepairCompanyMainRoute()
      : super(RepairCompanyMainRoute.name, path: '/repairCompany/');

  static const String name = 'RepairCompanyMainRoute';
}
