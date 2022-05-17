import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../views/drawer/clean_digital_drawer.dart';
import 'drawer/drawer_menu_item.dart';

class CommonView extends StatefulWidget {
  final List<DrawerMenuItem> items;

  const CommonView({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<CommonView> createState() => _CommonViewState();
}

class _CommonViewState extends State<CommonView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: widget.items.map((item) => item.route).toList(),
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.items[tabsRouter.activeIndex].title(
                context,
              ),
            ),
            centerTitle: false,
          ),
          drawer: CleanDigitalDrawer(
            items: widget.items,
            currentIndex: tabsRouter.activeIndex,
            onMenuItemTap: tabsRouter.setActiveIndex,
          ),
          body: FadeTransition(
            opacity: animation,
            child: SingleChildScrollView(
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
