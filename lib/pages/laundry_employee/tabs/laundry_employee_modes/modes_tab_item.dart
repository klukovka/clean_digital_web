import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../router/app_auto_router.gr.dart';
import '../../../../views/auto_tab_views/auto_tab_menu_item.dart';

enum ModesTabItem implements AutoTabMenuItem {
  modes,
  additionalModes;

  @override
  String title(BuildContext context) {
    final loc = CleanDigitalLocalizations.of(context);
    switch (this) {
      case ModesTabItem.additionalModes:
        return loc.additionalModes;
      case ModesTabItem.modes:
        return loc.modes;
    }
  }

  @override
  IconData get iconData {
    switch (this) {
      case ModesTabItem.additionalModes:
        return Icons.adf_scanner;
      case ModesTabItem.modes:
        return Icons.adf_scanner_outlined;
    }
  }

  @override
  PageRouteInfo get route {
    switch (this) {
      case ModesTabItem.additionalModes:
        return const AdditionalModesRoute();
      case ModesTabItem.modes:
        return const ModesRoute();
    }
  }
}
