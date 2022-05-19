import 'package:flutter/material.dart';

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
