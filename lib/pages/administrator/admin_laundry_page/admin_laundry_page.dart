import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../views/auto_tab_views/auto_tabs_view.dart';
import 'admin_laundry_page_tab_item.dart';

class AdminLaundryPage extends StatelessWidget {
  final String laundryId;

  const AdminLaundryPage({
    Key? key,
    @PathParam('laundryId') required this.laundryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsView(
      items: AdminLaundryPageTabItem.values,
      title: laundryId,
      id: laundryId,
    );
  }
}
