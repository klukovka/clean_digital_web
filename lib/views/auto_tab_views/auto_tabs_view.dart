import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'auto_tab_menu_item.dart';

class AutoTabsView extends StatelessWidget {
  final String title;
  final List<AutoTabMenuItem> items;

  const AutoTabsView({
    Key? key,
    required this.items,
    required this.title,
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
            bottom: TabBar(
              onTap: tabsRouter.setActiveIndex,
              tabs: items.map((item) {
                return Tab(
                  text: item.title(context),
                  icon: Icon(item.iconData),
                );
              }).toList(),
            ),
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
