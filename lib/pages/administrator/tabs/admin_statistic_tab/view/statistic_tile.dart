import 'package:flutter/material.dart';

import '../../../../../l10n/clean_digital_localizations.dart';
import '../../../../../models/statistic/all_laundry_statistic.dart';
import '../../../../../views/entity_tiles/entity_container_tile.dart';
import '../../../../../views/entity_tiles/entity_label.dart';

class StatisticTile extends StatelessWidget {
  final AllLaundryStatistic statistic;

  const StatisticTile({
    Key? key,
    required this.statistic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      titleChild: _buildLaundryInfo(context),
      onDeletePressed: null,
      onMorePressed: null,
      child: _buildInfo(context),
    );
  }

  Widget _buildLaundryInfo(BuildContext context) {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntityLabel(title: localization.name, value: statistic.laundry.name),
        EntityLabel(title: localization.phone, value: statistic.laundry.phone),
        EntityLabel(
            title: localization.address, value: statistic.laundry.address),
        EntityLabel(
            title: localization.email, value: statistic.laundry.user.email),
        EntityLabel(
          title: localization.maxWashMachines,
          value: '${statistic.laundry.maxAmount}',
        ),
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntityLabel(
            title: localization.paidBonuses,
            value: statistic.laundryPaymentValue?.paidBonuses),
        EntityLabel(
            title: localization.paidMoney,
            value: statistic.laundryPaymentValue?.paidMoney),
        EntityLabel(
            title: localization.allMoney,
            value: statistic.laundryPaymentValue?.all),
        EntityLabel(
            title: localization.rating, value: statistic.laundryRatingValue),
        EntityLabel(
            title: localization.repairAmount,
            value: statistic.laundryRepairValue?.amount),
        EntityLabel(
            title: localization.repairMoney,
            value: statistic.laundryRepairValue?.money),
        EntityLabel(
            title: localization.time,
            value: statistic.laundryTimeAndUsageValue?.time),
        EntityLabel(
            title: localization.powerUsage,
            value: statistic.laundryTimeAndUsageValue?.powerUsage),
      ],
    );
  }
}
