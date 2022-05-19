import 'package:flutter/material.dart';

class AdminEmployeesTab extends StatefulWidget {
  const AdminEmployeesTab({Key? key}) : super(key: key);

  @override
  State<AdminEmployeesTab> createState() => _AdminEmployeesTabState();
}

class _AdminEmployeesTabState extends State<AdminEmployeesTab> {
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
