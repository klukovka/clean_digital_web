import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../views/drawer/clean_digital_drawer.dart';
import 'drawer_menu_item.dart';

class AutoTabsDrawerView extends StatelessWidget {
  final List<DrawerMenuItem> items;

  const AutoTabsDrawerView({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: items.map((item) => item.route).toList(),
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              items[tabsRouter.activeIndex].title(
                context,
              ),
            ),
            centerTitle: false,
          ),
          drawer: CleanDigitalDrawer(
            items: items,
            currentIndex: tabsRouter.activeIndex,
            onMenuItemTap: tabsRouter.setActiveIndex,
          ),
          body: FadeTransition(
            opacity: animation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
