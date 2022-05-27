import 'package:flutter/material.dart';

class RepairEventsTab extends StatefulWidget {
  const RepairEventsTab({Key? key}) : super(key: key);

  @override
  State<RepairEventsTab> createState() => _RepairEventsTabState();
}

class _RepairEventsTabState extends State<RepairEventsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        runtimeType.toString(),
      ),
    );
  }
}
