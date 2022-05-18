import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../models/repair_company.dart';
import '../../resources/app_image_assets.dart';
import 'entity_container_tile.dart';
import 'entity_label.dart';

class RepairCompanyTile extends StatelessWidget {
  final RepairCompany company;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onMorePressed;

  const RepairCompanyTile({
    Key? key,
    required this.company,
    this.onDeletePressed,
    this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      dialogTitle:
          CleanDigitalLocalizations.of(context).doYouWantToDeleteRepairCompany,
      imageAsset: AppImageAssets.wranchImage,
      onDeletePressed: onDeletePressed,
      onMorePressed: onMorePressed,
      child: _buildInfo(context),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntityLabel(title: localization.name, value: company.name),
        EntityLabel(title: localization.phone, value: company.phone),
        EntityLabel(title: localization.address, value: company.address),
        EntityLabel(title: localization.email, value: company.user.email),
      ],
    );
  }
}
