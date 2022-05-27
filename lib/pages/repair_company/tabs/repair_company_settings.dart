import 'package:flutter/material.dart';

class RepairCompanySettingsTab extends StatefulWidget {
  const RepairCompanySettingsTab({Key? key}) : super(key: key);

  @override
  State<RepairCompanySettingsTab> createState() =>
      _RepairCompanySettingsTabState();
}

class _RepairCompanySettingsTabState extends State<RepairCompanySettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        runtimeType.toString(),
      ),
    );
  }
}
