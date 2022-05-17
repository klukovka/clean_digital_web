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
      body: CleanDigitalDrawer(
        items: AdminPageDrawerItem.values,
        currentIndex: 0,
        onMenuItemTap: (int value) {},
      ),
    );
  }
}
