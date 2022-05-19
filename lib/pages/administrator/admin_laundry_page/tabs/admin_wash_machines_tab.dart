import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/administrator/admin_laundry_page/tabs/admin_employees_tab/admin_employees_tab_cubit.dart';
import '../../../../di/injection_container.dart';

class AdminWashMachinesTab extends StatefulWidget {
  const AdminWashMachinesTab({Key? key}) : super(key: key);

  @override
  State<AdminWashMachinesTab> createState() => _AdminWashMachinesTabState();
}

class _AdminWashMachinesTabState extends State<AdminWashMachinesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Text('$this'),
      ),
    );
  }
}
