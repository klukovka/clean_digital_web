import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/laundry_employee/laundry_employee_statistic/laundry_employee_statistic_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../models/statistic/all_laundry_statistic.dart';
import '../../../models/statistic/payment.dart';
import '../../../models/statistic/repair.dart';
import '../../../models/statistic/time_and_usage.dart';
import '../../../utils/clean_digital_toasts.dart';
import '../../../views/entity_tiles/laundry_tile.dart';
import '../../../views/error_view.dart';
import '../../../views/loading_indicator.dart';

class LaundryEmployeeStatisticTab extends StatefulWidget
    implements AutoRouteWrapper {
  const LaundryEmployeeStatisticTab({Key? key}) : super(key: key);

  @override
  State<LaundryEmployeeStatisticTab> createState() =>
      _LaundryEmployeeStatisticTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LaundryEmployeeStatisticTabCubit>()..init(),
      child: this,
    );
  }
}

class _LaundryEmployeeStatisticTabState
    extends State<LaundryEmployeeStatisticTab> {
  LaundryEmployeeStatisticTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    LaundryEmployeeStatisticTabState state,
  ) {
    if (state.status == LaundryEmployeeStatisticTabStatus.error) {
      CleanDigitalToasts.of(context).showError(
        message: state.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaundryEmployeeStatisticTabCubit,
        LaundryEmployeeStatisticTabState>(
      listener: _onStateChanged,
      builder: (context, state) {
        switch (state.status) {
          case LaundryEmployeeStatisticTabStatus.error:
            return ErrorView(onPressed: cubit.init);
          case LaundryEmployeeStatisticTabStatus.loading:
            return const Center(child: LoadingIndicator());
          case LaundryEmployeeStatisticTabStatus.success:
            return _buildCharts(state.statistic);
        }
      },
    );
  }

  Widget _buildCharts(AllLaundryStatistic statistic) {
    final payment = statistic.laundryPaymentValue;
    final repair = statistic.laundryRepairValue;
    final usage = statistic.laundryTimeAndUsageValue;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Row(
            children: [
              if (payment != null) ...[
                Text(
                  CleanDigitalLocalizations.of(context).moneyStatistic,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(width: 16),
                _buildLaundryMoney(payment),
              ],
              const SizedBox(width: 32),
              if (payment != null &&
                  statistic.washMachinePaymentValue.isNotEmpty)
                _buildWashMachinesMoneyChart(statistic, payment),
              const SizedBox(width: 16),
              Flexible(child: LaundryTile(laundry: statistic.laundry)),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            CleanDigitalLocalizations.of(context).rating,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 16),
          _buildLaundryRatingChart(statistic),
          const SizedBox(height: 32),
          Row(
            children: [
              if (repair != null &&
                  statistic.washMachineRepairValue.isNotEmpty) ...[
                Text(
                  CleanDigitalLocalizations.of(context).repairStatistic,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 16),
                Stack(
                  children: [
                    _buildRepairMoneyChart(statistic, repair),
                    _buildRepairAmoutChart(statistic, repair),
                  ],
                ),
              ],
              const SizedBox(width: 32),
              if (usage != null &&
                  statistic.washMachineTimeAndUsageValue.isNotEmpty) ...[
                Text(
                  CleanDigitalLocalizations.of(context).usageStatistic,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 16),
                Stack(
                  children: [
                    _buildRepairPowerChart(statistic, usage),
                    _buildRepairTimeChart(statistic, usage),
                  ],
                ),
              ],
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildRepairTimeChart(
      AllLaundryStatistic statistic, TimeAndUsage usage) {
    final loc = CleanDigitalLocalizations.of(context);
    return SizedBox(
      width: 25.w,
      height: 25.w,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 0,
          sections: statistic.washMachineTimeAndUsageValue.map((wm) {
            final green = Random().nextInt(255);
            return PieChartSectionData(
              value: wm.value.time / usage.time,
              color: Theme.of(context).colorScheme.background.withGreen(green),
              title: '${wm.value.time} ${loc.minutes}',
              titlePositionPercentageOffset: 0.8,
              radius: 5.w,
              titleStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRepairPowerChart(
    AllLaundryStatistic statistic,
    TimeAndUsage usage,
  ) {
    return SizedBox(
      width: 25.w,
      height: 25.w,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 0,
          sections: statistic.washMachineTimeAndUsageValue.map((wm) {
            final green = Random().nextInt(100);
            return PieChartSectionData(
              value: wm.value.powerUsage / usage.powerUsage,
              color: Theme.of(context).colorScheme.background.withGreen(green),
              title: '${wm.value.powerUsage}',
              titlePositionPercentageOffset: 0.8,
              radius: 10.w,
              titleStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRepairMoneyChart(
    AllLaundryStatistic statistic,
    Repair repair,
  ) {
    return SizedBox(
      width: 25.w,
      height: 25.w,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 0,
          sections: statistic.washMachineRepairValue.map((wm) {
            final green = Random().nextInt(200) + 55;
            return PieChartSectionData(
              value: wm.value.money / repair.money,
              color: Theme.of(context).colorScheme.background.withGreen(green),
              title: '${wm.value.money}',
              titlePositionPercentageOffset: 0.8,
              radius: 10.w,
              titleStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRepairAmoutChart(
    AllLaundryStatistic statistic,
    Repair repair,
  ) {
    return SizedBox(
      width: 25.w,
      height: 25.w,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 0,
          sections: statistic.washMachineRepairValue.map((wm) {
            final green = Random().nextInt(150);
            return PieChartSectionData(
              value: wm.value.amount / repair.amount,
              color: Theme.of(context).colorScheme.background.withGreen(green),
              title: '${wm.value.amount}',
              titlePositionPercentageOffset: 0.8,
              radius: 5.w,
              titleStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildLaundryRatingChart(AllLaundryStatistic statistic) {
    return Row(
      children: [
        Expanded(child: _buildRatingChart(statistic)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel(
              Theme.of(context).colorScheme.secondary,
              CleanDigitalLocalizations.of(context).maxMark,
            ),
            const SizedBox(height: 16),
            _buildLabel(
              Theme.of(context).colorScheme.background,
              CleanDigitalLocalizations.of(context).laundryMark,
            ),
            const SizedBox(height: 16),
            _buildLabel(
              Theme.of(context).colorScheme.onSecondary,
              CleanDigitalLocalizations.of(context).washMachineMark,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingChart(AllLaundryStatistic statistic) {
    return SizedBox(
      width: 25.w,
      height: 15.w,
      child: BarChart(
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
          barGroups: [
            BarChartGroupData(
              x: 0,
              barsSpace: 10,
              barRods: [
                BarChartRodData(
                  toY: 5,
                  width: 30,
                  color: Theme.of(context).colorScheme.secondary,
                  rodStackItems: [
                    BarChartRodStackItem(
                      0,
                      statistic.laundryRatingValue,
                      Theme.of(context).colorScheme.background,
                    ),
                  ],
                )
              ],
            ),
            ...statistic.washMachineRatingValue.map((wm) {
              return BarChartGroupData(
                x: 0,
                barsSpace: 10,
                barRods: [
                  BarChartRodData(
                    toY: 5,
                    width: 30,
                    color: Theme.of(context).colorScheme.secondary,
                    rodStackItems: [
                      BarChartRodStackItem(
                        0,
                        wm.value,
                        Theme.of(context).colorScheme.onSecondary,
                      ),
                    ],
                  )
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildWashMachinesMoneyChart(
    AllLaundryStatistic statistic,
    Payment payment,
  ) {
    return SizedBox(
      width: 25.w,
      height: 15.w,
      child: Row(
        children: [
          Expanded(
            child: _buildWashMachinesMoneyChartData(
              statistic,
              payment,
            ),
          ),
          _buildLabels(),
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
          Theme.of(context).colorScheme.primary,
          CleanDigitalLocalizations.of(context).paidBonusesForWashMachine,
        ),
        const SizedBox(height: 16),
        _buildLabel(
          Theme.of(context).colorScheme.background,
          CleanDigitalLocalizations.of(context).allMoney,
        ),
      ],
    );
  }

  Widget _buildWashMachinesMoneyChartData(
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
                  wm.value.paidMoney < wm.value.paidBonuses
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
                  wm.value.paidMoney > wm.value.paidBonuses
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
