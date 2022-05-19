import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../models/wash_machine.dart';
import '../../resources/app_image_assets.dart';
import 'entity_container_tile.dart';
import 'entity_label.dart';

class WashMachineTile extends StatelessWidget {
  final WashMachine washMachine;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onMorePressed;

  const WashMachineTile({
    Key? key,
    required this.washMachine,
    this.onDeletePressed,
    this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      imageAsset: AppImageAssets.washMachineImage,
      onDeletePressed: onDeletePressed,
      onMorePressed: onMorePressed,
      color: !washMachine.isWorking
          ? Theme.of(context).colorScheme.errorContainer
          : washMachine.isWashing
              ? Theme.of(context).scaffoldBackgroundColor
              : null,
      child: _buildInfo(context),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntityLabel(title: localization.model, value: washMachine.model),
        EntityLabel(
          title: localization.manufacturer,
          value: washMachine.manufacturer,
        ),
        EntityLabel(
          title: localization.capacity,
          value: '${washMachine.capacity}',
        ),
        EntityLabel(
          title: localization.powerUsage,
          value: '${washMachine.powerUsage}',
        ),
        EntityLabel(
          title: localization.maxTime,
          value: '${washMachine.maxTime}',
        ),
        EntityLabel(
          title: localization.currentTime,
          value: '${washMachine.currentTime}',
        ),
        EntityLabel(
          title: localization.isWorking,
          value: washMachine.isWorking ? localization.yes : localization.no,
        ),
        EntityLabel(
          title: localization.isWashing,
          value: washMachine.isWashing ? localization.yes : localization.no,
        ),
      ],
    );
  }
}
