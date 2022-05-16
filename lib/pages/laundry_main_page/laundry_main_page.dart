import 'package:flutter/material.dart';

class LaundryMainPage extends StatefulWidget {
  const LaundryMainPage({Key? key}) : super(key: key);

  @override
  State<LaundryMainPage> createState() => _LaundryMainPageState();
}

class _LaundryMainPageState extends State<LaundryMainPage> {
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
