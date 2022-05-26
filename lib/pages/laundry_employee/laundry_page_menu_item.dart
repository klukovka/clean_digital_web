import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../router/app_auto_router.gr.dart';
import '../../views/auto_tab_views/auto_tab_menu_item.dart';

enum LaundryPageMenuItem implements AutoTabMenuItem {
  washingMachines,
  employees,
  allModes,
  events,
  repairEvents,
  statistic,
  settings;

  @override
  String title(BuildContext context) {
    final loc = CleanDigitalLocalizations.of(context);

    switch (this) {
      case LaundryPageMenuItem.washingMachines:
        return loc.washMachines;
      case LaundryPageMenuItem.employees:
        return loc.employees;
      case LaundryPageMenuItem.allModes:
        return loc.allModes;
      case LaundryPageMenuItem.repairEvents:
        return loc.repairEvents;
      case LaundryPageMenuItem.statistic:
        return loc.statistic;
      case LaundryPageMenuItem.settings:
        return loc.settings;
      case LaundryPageMenuItem.events:
        return loc.events;
    }
  }

  @override
  IconData get iconData {
    switch (this) {
      case LaundryPageMenuItem.washingMachines:
        return Icons.local_laundry_service_rounded;
      case LaundryPageMenuItem.employees:
        return FontAwesome5.users;
      case LaundryPageMenuItem.allModes:
        return FontAwesome5.typo3;
      case LaundryPageMenuItem.repairEvents:
        return FontAwesome.wrench;
      case LaundryPageMenuItem.statistic:
        return FontAwesome5.chart_pie;
      case LaundryPageMenuItem.settings:
        return FontAwesome.cog_alt;
      case LaundryPageMenuItem.events:
        return Icons.event;
    }
  }

  @override
  PageRouteInfo get route {
    switch (this) {
      case LaundryPageMenuItem.washingMachines:
        return const LaundryWashMachinesRoute();
      case LaundryPageMenuItem.employees:
        return const LaundryEmployeesRoute();
      case LaundryPageMenuItem.allModes:
        return const LaundryAllModesRoute();
      case LaundryPageMenuItem.repairEvents:
        return const LaundryRepairEventsRoute();
      case LaundryPageMenuItem.statistic:
        return const LaundryStatisticRoute();
      case LaundryPageMenuItem.settings:
        return const LaundrySettingsRoute();
      case LaundryPageMenuItem.events:
        return const LaundryEventsRoute();
    }
  }
}
