import 'package:flutter/material.dart';

import '../models/laundry.dart';

class LaundryTile extends StatelessWidget {
  final Laundry laundry;

  const LaundryTile({
    Key? key,
    required this.laundry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
