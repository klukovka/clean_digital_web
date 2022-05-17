import 'package:flutter/material.dart';

import '../../views/common_view.dart';
import 'admin_page_drawer_item.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  @override
  Widget build(BuildContext context) {
    return const CommonView(
      items: AdminPageDrawerItem.values,
    );
  }
}
