import 'package:flutter/material.dart';

import '../../views/auto_tab_views/auto_tabs_drawer_view.dart';
import 'repair_company_drawer_item.dart';

class RepairCompanyPage extends StatefulWidget {
  const RepairCompanyPage({Key? key}) : super(key: key);

  @override
  State<RepairCompanyPage> createState() => _RepairCompanyPageState();
}

class _RepairCompanyPageState extends State<RepairCompanyPage> {
  @override
  Widget build(BuildContext context) {
    return const AutoTabsDrawerView(
      items: RepairCompanyDrawerItem.values,
    );
  }
}
