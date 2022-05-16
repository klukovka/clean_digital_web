import 'package:flutter/material.dart';

class RepairCompanyMainPage extends StatefulWidget {
  const RepairCompanyMainPage({Key? key}) : super(key: key);

  @override
  State<RepairCompanyMainPage> createState() => _RepairCompanyMainPageState();
}

class _RepairCompanyMainPageState extends State<RepairCompanyMainPage> {
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
