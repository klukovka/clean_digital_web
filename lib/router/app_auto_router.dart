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
import '../pages/laundry_employee/choose_wash_machines_page.dart';
import '../pages/repair_company/repair_company_page.dart';
import '../pages/laundry_employee/employee_page.dart';
import '../pages/laundry_employee/laundry_employee_repair_products_page.dart';
import '../pages/laundry_employee/laundry_page.dart';
import '../pages/laundry_employee/tabs/employee_settings_tab.dart';
import '../pages/laundry_employee/tabs/laundry_employee_events_tab.dart';
import '../pages/laundry_employee/tabs/laundry_employee_modes/additional_mode_tab.dart';
import '../pages/laundry_employee/tabs/laundry_employee_modes/laundry_employee_modes_tab.dart';
import '../pages/laundry_employee/tabs/laundry_employee_modes/modes_tab.dart';
import '../pages/laundry_employee/tabs/laundry_employee_repair_events_tab.dart';
import '../pages/laundry_employee/tabs/laundry_employee_statistic.dart';
import '../pages/laundry_employee/tabs/laundry_employee_wash_machines_tab.dart';
import '../pages/laundry_employee/tabs/laundry_employees_tab.dart';
import '../pages/laundry_employee/tabs/laundry_settings_tab.dart';
import '../pages/repair_company/tabs/repair_company_settings_tab.dart';
import '../pages/repair_company/tabs/repair_events_tab.dart';
import '../pages/repair_company/tabs/repair_products_tab.dart';
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
      page: LaundryPage,
      path: '/laundry/',
      name: 'LaundryRoute',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
      children: [
        CustomRoute(
          page: LaundryEmployeeWashMachinesTab,
          initial: true,
          name: 'LaundryWashMachinesRoute',
          path: 'washingMachines/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: LaundryEmployeesTab,
          path: 'employees/',
          name: 'LaundryEmployeesRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: LaundryEmployeeEventsTab,
          path: 'events/',
          name: 'LaundryEventsRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: LaundryEmployeeAllModesTab,
          name: 'LaundryAllModesRoute',
          path: 'allModes/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
          children: [
            CustomRoute(
              page: ModesTab,
              initial: true,
              path: 'modes/',
              transitionsBuilder: _fadeIn,
              durationInMilliseconds: _durationInMilliseconds,
            ),
            CustomRoute(
              page: AdditionalModesTab,
              path: 'additionalModes/',
              transitionsBuilder: _fadeIn,
              durationInMilliseconds: _durationInMilliseconds,
            ),
          ],
        ),
        CustomRoute(
          page: LaundryEmployeeRepairEventsTab,
          name: 'LaundryRepairEventsRoute',
          path: 'repairEvents/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: LaundryEmployeeStatisticTab,
          path: 'statistic/',
          name: 'LaundryStatisticRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: LaundrySettingsTab,
          path: 'settings/',
          name: 'LaundrySettingsRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
      ],
    ),
    CustomRoute(
      page: EmployeePage,
      path: '/employee/',
      name: 'EmployeeRoute',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
      children: [
        CustomRoute(
          page: LaundryEmployeeWashMachinesTab,
          initial: true,
          path: 'washingMachines/',
          name: 'EmployeeWashMachinesRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: LaundryEmployeeEventsTab,
          path: 'events/',
          name: 'EmployeeEventsRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: LaundryEmployeeAllModesTab,
          path: 'allModes/',
          name: 'EmployeeAllModesRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
          children: [
            CustomRoute(
              page: ModesTab,
              initial: true,
              path: 'modes/',
              transitionsBuilder: _fadeIn,
              durationInMilliseconds: _durationInMilliseconds,
            ),
            CustomRoute(
              page: AdditionalModesTab,
              path: 'additionalModes/',
              transitionsBuilder: _fadeIn,
              durationInMilliseconds: _durationInMilliseconds,
            ),
          ],
        ),
        CustomRoute(
          page: LaundryEmployeeRepairEventsTab,
          path: 'repairEvents/',
          name: 'EmployeeRepairEventsRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: LaundryEmployeeStatisticTab,
          path: 'statistic/',
          name: 'EmployeeStatisticRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: EmployeeSettingsTab,
          path: 'settings/',
          name: 'EmployeeSettingsRoute',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
      ],
    ),
    CustomRoute(
      page: LaundryEmployeeRepairProductsPage,
      path: '/chooseRepairProducts/',
      transitionsBuilder: _fadeIn,
      fullscreenDialog: true,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: ChooseWashMachinesPage,
      path: '/chooseWashMachines/',
      transitionsBuilder: _fadeIn,
      fullscreenDialog: true,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: RepairCompanyPage,
      path: '/repairCompany/',
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
      children: [
        CustomRoute(
          page: RepairProductsTab,
          path: 'products/',
          initial: true,
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: RepairEventsTab,
          path: 'events/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
        CustomRoute(
          page: RepairCompanySettingsTab,
          path: 'settings/',
          transitionsBuilder: _fadeIn,
          durationInMilliseconds: _durationInMilliseconds,
        ),
      ],
    ),
  ],
)
class $AppAutoRouter {}
