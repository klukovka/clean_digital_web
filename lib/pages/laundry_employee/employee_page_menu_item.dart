import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../router/app_auto_router.gr.dart';
import '../../views/auto_tab_views/auto_tab_menu_item.dart';

enum EmployeePageMenuItem implements AutoTabMenuItem {
  washingMachines,
  allModes,
  repairEvents,
  statistic,
  settings;

  @override
  String title(BuildContext context) {
    final loc = CleanDigitalLocalizations.of(context);

    switch (this) {
      case EmployeePageMenuItem.washingMachines:
        return loc.washMachines;
      case EmployeePageMenuItem.allModes:
        return loc.allModes;
      case EmployeePageMenuItem.repairEvents:
        return loc.repairEvents;
      case EmployeePageMenuItem.statistic:
        return loc.statistic;
      case EmployeePageMenuItem.settings:
        return loc.settings;
    }
  }

  @override
  IconData get iconData {
    switch (this) {
      case EmployeePageMenuItem.washingMachines:
        return Icons.local_laundry_service_rounded;
      case EmployeePageMenuItem.allModes:
        return FontAwesome5.typo3;
      case EmployeePageMenuItem.repairEvents:
        return FontAwesome.wrench;
      case EmployeePageMenuItem.statistic:
        return FontAwesome5.chart_pie;
      case EmployeePageMenuItem.settings:
        return FontAwesome.cog_alt;
    }
  }

  @override
  PageRouteInfo get route {
    switch (this) {
      case EmployeePageMenuItem.washingMachines:
        return const EmployeeWashMachinesRoute();
      case EmployeePageMenuItem.allModes:
        return const EmployeeAllModesRoute();
      case EmployeePageMenuItem.repairEvents:
        return const EmployeeRepairEventsRoute();
      case EmployeePageMenuItem.statistic:
        return const EmployeeStatisticRoute();
      case EmployeePageMenuItem.settings:
        return const EmployeeSettingsRoute();
    }
  }
}
