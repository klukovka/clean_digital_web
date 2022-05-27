import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../models/repair_product.dart';

class LaundryEmployeeRepairProductsPage extends StatefulWidget {
  final ValueSetter<RepairProduct> onChosen;

  const LaundryEmployeeRepairProductsPage({
    Key? key,
    required this.onChosen,
  }) : super(key: key);

  @override
  State<LaundryEmployeeRepairProductsPage> createState() =>
      _LaundryEmployeeRepairProductsPageState();
}

class _LaundryEmployeeRepairProductsPageState
    extends State<LaundryEmployeeRepairProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CleanDigitalLocalizations.of(context).chooseOne),
      ),
    );
  }
}
