import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../models/repair_product.dart';
import 'entity_container_tile.dart';
import 'entity_label.dart';

class RepairProductTile extends StatelessWidget {
  final RepairProduct repairProduct;
  final VoidCallback? onDeletePressed;
  final String? moreText;
  final VoidCallback? onMorePressed;

  const RepairProductTile({
    Key? key,
    required this.repairProduct,
    this.onDeletePressed,
    this.onMorePressed,
    this.moreText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      onDeletePressed: onDeletePressed,
      onMorePressed: onMorePressed,
      moreText: moreText,
      child: _buildInfo(context),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntityLabel(
            title: localization.repairType,
            value: repairProduct.type.getTitle(context)),
        EntityLabel(
            title: localization.description, value: repairProduct.description),
        EntityLabel(title: localization.costs, value: repairProduct.costs),
      ],
    );
  }
}
