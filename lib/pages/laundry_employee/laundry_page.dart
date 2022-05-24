import 'package:flutter/material.dart';

import '../../views/auto_tab_views/auto_tabs_drawer_view.dart';
import 'laundry_page_menu_item.dart';

class LaundryPage extends StatelessWidget {
  const LaundryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoTabsDrawerView(
      items: LaundryPageMenuItem.values,
    );
  }
}
