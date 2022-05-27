import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../models/repair_event.dart';
import 'entity_container_tile.dart';
import 'entity_label.dart';

class RepairEventTile extends StatelessWidget {
  final RepairEvent repairEvent;
  final VoidCallback? onMorePressed;

  const RepairEventTile({
    Key? key,
    required this.repairEvent,
    this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      onMorePressed: onMorePressed,
      titleChild: _buildInfo(context),
      moreText: CleanDigitalLocalizations.of(context).done,
      child: _buildChild(context),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntityLabel(title: localization.costs, value: repairEvent.costs),
        EntityLabel(title: localization.date, value: repairEvent.date),
        EntityLabel(title: localization.done, value: repairEvent.done),
      ],
    );
  }

  Widget _buildChild(BuildContext context) {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntityLabel(
            title: localization.washMachineId,
            value: repairEvent.washMachineId),
        EntityLabel(
            title: localization.repairProductId,
            value: repairEvent.repairProductId),
      ],
    );
  }
}
