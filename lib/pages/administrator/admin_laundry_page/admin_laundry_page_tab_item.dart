import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

import '../../../l10n/clean_digital_localizations.dart';
import '../../../router/app_auto_router.gr.dart';
import '../../../views/auto_tab_views/auto_tab_menu_item.dart';

enum AdminLaundryPageTabItem implements AutoTabMenuItem {
  washMachines,
  employees;

  @override
  String title(BuildContext context) {
    final loc = CleanDigitalLocalizations.of(context);
    switch (this) {
      case AdminLaundryPageTabItem.employees:
        return loc.employees;
      case AdminLaundryPageTabItem.washMachines:
        return loc.washMachines;
    }
  }

  @override
  IconData get iconData {
    switch (this) {
      case AdminLaundryPageTabItem.employees:
        return Typicons.users;
      case AdminLaundryPageTabItem.washMachines:
        return Icons.local_laundry_service_outlined;
    }
  }

  @override
  PageRouteInfo route(String path) {
    switch (this) {
      case AdminLaundryPageTabItem.employees:
        return AdminEmployeesRoute();
      case AdminLaundryPageTabItem.washMachines:
        return AdminWashMachinesRoute();
    }
  }
}
