import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'auto_tab_menu_item.dart';

class AutoTabsView extends StatelessWidget {
  final String title;
  final String id;
  final List<AutoTabMenuItem> items;
  final VoidCallback? onPressed;

  const AutoTabsView({
    Key? key,
    required this.items,
    required this.title,
    required this.id,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: items.map((item) => item.route(id)).toList(),
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return DefaultTabController(
          length: items.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              centerTitle: false,
              bottom: TabBar(
                onTap: tabsRouter.setActiveIndex,
                padding: EdgeInsets.zero,
                tabs: items.map((item) {
                  return Tab(
                    text: item.title(context),
                    icon: Icon(item.iconData),
                  );
                }).toList(),
              ),
              actions: [
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.more_horiz),
                )
              ],
            ),
            body: FadeTransition(
              opacity: animation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
