import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../views/drawer/clean_digital_drawer.dart';
import 'admin_page_drawer_item.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        routes: AdminPageDrawerItem.values.map((item) => item.route).toList(),
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Row(
            children: [
              CleanDigitalDrawer(
                items: AdminPageDrawerItem.values,
                currentIndex: tabsRouter.activeIndex,
                onMenuItemTap: tabsRouter.setActiveIndex,
              ),
              FadeTransition(
                opacity: animation,
                child: child,
              ),
            ],
          );
        },
      ),
    );
  }
}
