import 'package:auto_route/auto_route.dart';

import '../pages/administrator/admin_laundry_page/admin_laundry_page.dart';
import '../pages/administrator/admin_laundry_page/tabs/admin_employees_tab.dart';
import '../pages/administrator/admin_laundry_page/tabs/admin_wash_machines_tab.dart';
import '../pages/administrator/admin_page.dart';
import '../pages/administrator/tabs/admin_backups_tab/admin_backups_tab.dart';
import '../pages/administrator/tabs/admin_clients_tab/admin_clients_tab.dart';
import '../pages/administrator/tabs/admin_laundries_tab/admin_laundries_tab.dart';
import '../pages/administrator/tabs/admin_repair_companies_tab/admin_repair_companies_tab.dart';
import '../pages/administrator/tabs/admin_settings_tab/admin_settings_tab.dart';
import '../pages/administrator/tabs/admin_statistic_tab/admin_statistic_tab.dart';
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
      page: AdminPage,
      path: '/admin/',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
      children: [
        CustomRoute(
          page: AdminLaundriesTab,
          path: 'laundries/',
          initial: true,
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: AdminBackupsTab,
          path: 'backups/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: AdminClientsTab,
          path: 'clients/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: AdminStatisticTab,
          path: 'statistic/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: AdminSettingsTab,
          path: 'settings/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: AdminRepairCompaniesTab,
          path: 'repairCompanies/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
      ],
    ),
    CustomRoute(
      page: AdminLaundryPage,
      path: '/admin/laundries/:laundryId/',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
      children: [
        CustomRoute(
          page: AdminWashMachinesTab,
          path: 'washMachines/',
          initial: true,
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: AdminEmployeesTab,
          path: 'employees/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
      ],
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
