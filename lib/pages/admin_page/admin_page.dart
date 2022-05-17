import 'package:flutter/material.dart';

import '../../views/common_view.dart';
import 'admin_page_drawer_item.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonView(
      items: AdminPageDrawerItem.values,
    );
  }
}
