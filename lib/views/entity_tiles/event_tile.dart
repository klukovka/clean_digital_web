import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../models/event.dart';
import '../../resources/app_image_assets.dart';
import 'entity_container_tile.dart';
import 'entity_label.dart';

class EventTile extends StatelessWidget {
  final Event event;

  const EventTile({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      imageAsset: AppImageAssets.eventImage,
      child: _buildInfo(context),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntityLabel(title: localization.temperature, value: event.temperature),
        EntityLabel(title: localization.spinningSpeed, value: event.spinning),
        EntityLabel(title: localization.mode, value: event.mode.name),
        EntityLabel(
            title: localization.additionalMode,
            value: event.additionalMode?.name),
        EntityLabel(title: localization.timeBegin, value: event.timeBegin),
        EntityLabel(title: localization.timeEnd, value: event.timeEnd),
        EntityLabel(title: localization.paidStatus, value: event.paidStatus),
        EntityLabel(title: localization.paidBonuses, value: event.paidBonuses),
        EntityLabel(title: localization.paidMoney, value: event.paidMoney),
        EntityLabel(title: localization.taken, value: event.taken),
        EntityLabel(title: localization.rating, value: event.rating),
      ],
    );
  }
}
