import 'package:flutter/material.dart';

import '../../di/injection_container.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../services/preferences_service.dart';
import 'drawer_item.dart';
import 'drawer_menu_item.dart';

class CleanDigitalDrawer extends StatelessWidget {
  final List<DrawerMenuItem> items;
  final ValueSetter<int> onMenuItemTap;
  final int currentIndex;

  const CleanDigitalDrawer({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onMenuItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: _buildLogo(context),
          ),
          ...items.map((item) {
            final index = items.indexOf(item);
            return DrawerItem(
              iconData: item.iconData,
              title: item.title(context),
              isActive: currentIndex == index,
              onPressed: () => onMenuItemTap(index),
            );
          })
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final role = locator<PreferencesService>().getRole();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_laundry_service,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 32,
            ),
            const SizedBox(width: 8),
            Text(
              CleanDigitalLocalizations.of(context).appName,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          role.getTitle(context),
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
