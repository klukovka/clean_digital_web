import 'package:flutter/material.dart';

import '../../views/auto_tab_views/auto_tabs_drawer_view.dart';
import 'admin_page_drawer_item.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoTabsDrawerView(
      items: AdminPageDrawerItem.values,
    );
  }
}
