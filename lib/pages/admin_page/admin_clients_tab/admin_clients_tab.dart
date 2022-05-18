import 'package:flutter/material.dart';

class AdminClientsTab extends StatelessWidget {
  const AdminClientsTab({Key? key}) : super(key: key);

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
