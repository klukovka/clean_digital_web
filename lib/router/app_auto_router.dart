import 'package:auto_route/auto_route.dart';

import '../pages/admin_main_page/admin_main_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/restore_password_page.dart';
import '../pages/employee_main_page/employee_main_page.dart';
import '../pages/laundry_main_page/laundry_main_page.dart';
import '../pages/repair_company_main_page/repair_company_main_page.dart';
import '../pages/splash_page/splash_page.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Tab,Route',
  routes: [
    CustomRoute(
      page: SplashPage,
      path: '/init',
      initial: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: LoginPage,
      path: '/auth/login',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: RestorePasswordPage,
      path: '/auth/restore',
      fullscreenDialog: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: AdminMainPage,
      path: '/admin/',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: LaundryMainPage,
      path: '/laundry/',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: EmployeeMainPage,
      path: '/employee/',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: RepairCompanyMainPage,
      path: '/repairCompany/',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
  ],
)
class $AppAutoRouter {}
