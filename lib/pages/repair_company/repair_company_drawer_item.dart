import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../router/app_auto_router.gr.dart';
import '../../views/auto_tab_views/auto_tab_menu_item.dart';

enum RepairCompanyDrawerItem implements AutoTabMenuItem {
  products,
  events,
  settings;

  @override
  String title(BuildContext context) {
    final loc = CleanDigitalLocalizations.of(context);
    switch (this) {
      case RepairCompanyDrawerItem.products:
        return loc.repairProducts;
      case RepairCompanyDrawerItem.events:
        return loc.repairEvents;
      case RepairCompanyDrawerItem.settings:
        return loc.settings;
    }
  }

  @override
  IconData get iconData {
    switch (this) {
      case RepairCompanyDrawerItem.products:
        return FontAwesome.wrench;
      case RepairCompanyDrawerItem.events:
        return Icons.event;
      case RepairCompanyDrawerItem.settings:
        return FontAwesome.cog_alt;
    }
  }

  @override
  PageRouteInfo get route {
    switch (this) {
      case RepairCompanyDrawerItem.products:
        return const RepairProductsRoute();
      case RepairCompanyDrawerItem.events:
        return const RepairEventsRoute();
      case RepairCompanyDrawerItem.settings:
        return const RepairCompanySettingsRoute();
    }
  }
}
