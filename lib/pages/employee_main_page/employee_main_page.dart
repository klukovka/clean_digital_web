import 'package:flutter/material.dart';

class EmployeeMainPage extends StatefulWidget {
  const EmployeeMainPage({Key? key}) : super(key: key);

  @override
  State<EmployeeMainPage> createState() => _EmployeeMainPageState();
}

class _EmployeeMainPageState extends State<EmployeeMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          runtimeType.toString(),
        ),
      ),
    );
  }
}
