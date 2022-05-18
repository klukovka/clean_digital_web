import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../models/laundry.dart';
import '../../resources/app_image_assets.dart';
import 'entity_container_tile.dart';
import 'entity_label.dart';

class LaundryTile extends StatelessWidget {
  final Laundry laundry;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onMorePressed;

  const LaundryTile({
    Key? key,
    required this.laundry,
    this.onDeletePressed,
    this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      dialogTitle:
          CleanDigitalLocalizations.of(context).doYouWantToDeleteLaundry,
      imageAsset: AppImageAssets.laundryImage,
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
        EntityLabel(title: localization.name, value: laundry.name),
        EntityLabel(title: localization.phone, value: laundry.phone),
        EntityLabel(title: localization.address, value: laundry.address),
        EntityLabel(title: localization.email, value: laundry.user.email),
        EntityLabel(
          title: localization.maxWashMachines,
          value: '${laundry.maxAmount}',
        ),
      ],
    );
  }
}
