import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../router/app_auto_router.gr.dart';
import '../../views/auto_tab_views/auto_tab_menu_item.dart';

enum AdminPageDrawerItem implements AutoTabMenuItem {
  laundries,
  repairCompanies,
  clients,
  backups,
  statistic,
  settings;

  @override
  String title(BuildContext context) {
    final loc = CleanDigitalLocalizations.of(context);
    switch (this) {
      case AdminPageDrawerItem.laundries:
        return loc.laundries;
      case AdminPageDrawerItem.repairCompanies:
        return loc.repairCompanies;
      case AdminPageDrawerItem.clients:
        return loc.clients;
      case AdminPageDrawerItem.backups:
        return loc.backups;
      case AdminPageDrawerItem.statistic:
        return loc.statistic;
      case AdminPageDrawerItem.settings:
        return loc.settings;
    }
  }

  @override
  IconData get iconData {
    switch (this) {
      case AdminPageDrawerItem.laundries:
        return FontAwesome5.hands_wash;
      case AdminPageDrawerItem.repairCompanies:
        return FontAwesome.wrench;
      case AdminPageDrawerItem.clients:
        return FontAwesome5.users;
      case AdminPageDrawerItem.backups:
        return FontAwesome5.database;
      case AdminPageDrawerItem.statistic:
        return FontAwesome5.chart_pie;
      case AdminPageDrawerItem.settings:
        return FontAwesome.cog_alt;
    }
  }

  @override
  PageRouteInfo get route {
    switch (this) {
      case AdminPageDrawerItem.laundries:
        return const AdminLaundriesRoute();
      case AdminPageDrawerItem.repairCompanies:
        return const AdminRepairCompaniesRoute();
      case AdminPageDrawerItem.clients:
        return const AdminClientsRoute();
      case AdminPageDrawerItem.backups:
        return const AdminBackupsRoute();
      case AdminPageDrawerItem.statistic:
        return const AdminStatisticRoute();
      case AdminPageDrawerItem.settings:
        return const AdminSettingsRoute();
    }
  }
}
