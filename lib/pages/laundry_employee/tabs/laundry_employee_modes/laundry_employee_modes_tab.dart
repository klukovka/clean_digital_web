import 'package:flutter/material.dart';

import '../../../../views/auto_tab_views/auto_tabs_view.dart';
import 'modes_tab_item.dart';

class LaundryEmployeeAllModesTab extends StatefulWidget {
  const LaundryEmployeeAllModesTab({Key? key}) : super(key: key);

  @override
  State<LaundryEmployeeAllModesTab> createState() =>
      _LaundryEmployeeAllModesTabState();
}

class _LaundryEmployeeAllModesTabState
    extends State<LaundryEmployeeAllModesTab> {
  @override
  Widget build(BuildContext context) {
    return const AutoTabsView(
      items: ModesTabItem.values,
      hasAppBar: false,
    );
  }
}
