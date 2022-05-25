import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'auto_tab_menu_item.dart';

class AutoTabsView extends StatelessWidget {
  final Widget? title;
  final List<AutoTabMenuItem> items;
  final VoidCallback? onPressed;
  final VoidCallback? onBackPressed;
  final bool hasAppBar;

  const AutoTabsView({
    Key? key,
    required this.items,
    this.hasAppBar = true,
    this.title,
    this.onPressed,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: items.map((item) => item.route).toList(),
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return DefaultTabController(
          length: items.length,
          child: Scaffold(
            appBar: AppBar(
              title: hasAppBar ? title : null,
              centerTitle: false,
              automaticallyImplyLeading: !hasAppBar,
              backgroundColor: hasAppBar
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).scaffoldBackgroundColor,
              leading: hasAppBar
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: onBackPressed,
                    )
                  : null,
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
