import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../models/client.dart';
import '../../resources/app_image_assets.dart';
import 'entity_container_tile.dart';
import 'entity_label.dart';

class ClientTile extends StatelessWidget {
  final Client client;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onMorePressed;

  const ClientTile({
    Key? key,
    required this.client,
    this.onDeletePressed,
    this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      dialogTitle:
          CleanDigitalLocalizations.of(context).doYouWantToDeleteClient,
      imageAsset: AppImageAssets.clientImage,
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
        EntityLabel(title: localization.name, value: client.name),
        EntityLabel(title: localization.phone, value: client.phone),
        EntityLabel(title: localization.email, value: client.user.email),
        EntityLabel(title: localization.bonuses, value: '${client.bonuses}'),
        EntityLabel(title: localization.sale, value: '${client.sale}'),
      ],
    );
  }
}
