import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../views/drawer/drawer_menu_item.dart';

enum AdminPageDrawerItem implements DrawerMenuItem {
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
}
