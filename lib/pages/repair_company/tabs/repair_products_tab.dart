import 'package:flutter/material.dart';

class RepairProductsTab extends StatefulWidget {
  const RepairProductsTab({Key? key}) : super(key: key);

  @override
  State<RepairProductsTab> createState() => _RepairProductsTabState();
}

class _RepairProductsTabState extends State<RepairProductsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        runtimeType.toString(),
      ),
    );
  }
}
