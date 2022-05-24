import 'package:flutter/material.dart';

import '../../views/auto_tab_views/auto_tabs_drawer_view.dart';
import 'employee_page_menu_item.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoTabsDrawerView(
      items: EmployeePageMenuItem.values,
    );
  }
}
