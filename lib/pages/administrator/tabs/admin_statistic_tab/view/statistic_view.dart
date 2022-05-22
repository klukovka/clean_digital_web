import 'package:clean_digital_web/models/statistic/payment.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../l10n/clean_digital_localizations.dart';
import '../../../../../models/statistic/all_laundry_statistic.dart';
import '../../../../../views/expanded_section.dart';

class StatisticView extends StatefulWidget {
  final AllLaundryStatistic? laundryStatistic;
  final VoidCallback onPressed;

  const StatisticView({
    Key? key,
    required this.onPressed,
    this.laundryStatistic,
  }) : super(key: key);

  @override
  State<StatisticView> createState() => _StatisticViewState();
}

class _StatisticViewState extends State<StatisticView> {
  @override
  Widget build(BuildContext context) {
    final laundry = widget.laundryStatistic;

    return ExpandedSection(
      expand: widget.laundryStatistic != null,
      axis: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 30.w,
        child: laundry != null ? _buildCharts(laundry) : null,
      ),
    );
  }

  Widget _buildCharts(AllLaundryStatistic statistic) {
    final payment = statistic.laundryPaymentValue;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: widget.onPressed,
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            CleanDigitalLocalizations.of(context).moneyStatistic,
            style: Theme.of(context).textTheme.headline5,
          ),
          if (payment != null) _buildLaundryMoney(payment),
          const SizedBox(height: 32),
          if (payment != null && statistic.washMachinePaymentValue.isNotEmpty)
            SizedBox(
              width: 25.w,
              height: 15.w,
              child: Row(
                children: [
                  Expanded(
                    child: _buildWashMachinesMoneyChart(
                      statistic,
                      payment,
                    ),
                  ),
                  _buildLabels(),
                ],
              ),
            ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildLabels() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(
          Theme.of(context).colorScheme.onPrimary,
          CleanDigitalLocalizations.of(context).paidMoneyForWashMachine,
        ),
        const SizedBox(height: 16),
        _buildLabel(
          Theme.of(context).colorScheme.background,
          CleanDigitalLocalizations.of(context).paidBonusesForWashMachine,
        ),
        const SizedBox(height: 16),
        _buildLabel(
          Theme.of(context).colorScheme.secondary,
          CleanDigitalLocalizations.of(context).allMoney,
        ),
      ],
    );
  }

  Widget _buildWashMachinesMoneyChart(
    AllLaundryStatistic statistic,
    Payment payment,
  ) {
    return BarChart(
      BarChartData(
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        barGroups: statistic.washMachinePaymentValue.map((wm) {
          return BarChartGroupData(
            x: 0,
            barsSpace: 10,
            barRods: [
              BarChartRodData(
                toY: payment.all,
                width: 30,
                color: Theme.of(context).colorScheme.secondary,
                rodStackItems: [
                  BarChartRodStackItem(
                    0,
                    wm.value.all,
                    Theme.of(context).colorScheme.background,
                  ),
                  wm.value.paidMoney > wm.value.paidBonuses
                      ? BarChartRodStackItem(
                          0,
                          wm.value.paidMoney,
                          Theme.of(context).colorScheme.onPrimary,
                        )
                      : BarChartRodStackItem(
                          0,
                          wm.value.paidBonuses,
                          Theme.of(context).colorScheme.primary,
                        ),
                  wm.value.paidMoney < wm.value.paidBonuses
                      ? BarChartRodStackItem(
                          0,
                          wm.value.paidBonuses,
                          Theme.of(context).colorScheme.primary,
                        )
                      : BarChartRodStackItem(
                          0,
                          wm.value.paidMoney,
                          Theme.of(context).colorScheme.onPrimary,
                        ),
                ],
              )
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLaundryMoney(Payment payment) {
    return SizedBox(
      width: 25.w,
      height: 25.w,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 0,
          sections: [
            PieChartSectionData(
              value: payment.paidBonuses / payment.all,
              color: Theme.of(context).colorScheme.background,
              title: CleanDigitalLocalizations.of(context).paidBonuses,
              titlePositionPercentageOffset: 0.8,
              radius: 10.w,
              titleStyle: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            PieChartSectionData(
              value: payment.paidMoney / payment.all,
              color: Theme.of(context).colorScheme.secondary,
              radius: 12.w,
              title: CleanDigitalLocalizations.of(context).paidMoney,
              titleStyle: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(Color color, String title) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 16),
        Text(title)
      ],
    );
  }
}
