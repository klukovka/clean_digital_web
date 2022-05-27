import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/laundry_employee/tabs/laundry_employee_repair_events_tab/laundry_employee_repair_events_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../utils/clean_digital_dialogs.dart';
import '../../../utils/clean_digital_toasts.dart';
import '../../../views/entity_tiles/repair_event_tile.dart';
import '../../../views/error_view.dart';
import '../../../views/loading_indicator.dart';
import '../../../views/title_with_button.dart';

class LaundryEmployeeRepairEventsTab extends StatefulWidget
    with AutoRouteWrapper {
  const LaundryEmployeeRepairEventsTab({Key? key}) : super(key: key);

  @override
  State<LaundryEmployeeRepairEventsTab> createState() =>
      _LaundryEmployeeRepairEventsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          locator<LaundryEmployeeRepairEventsTabCubit>()..getRepairEvents(),
      child: this,
    );
  }
}

class _LaundryEmployeeRepairEventsTabState
    extends State<LaundryEmployeeRepairEventsTab> {
  LaundryEmployeeRepairEventsTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    LaundryEmployeeRepairEventsTabState state,
  ) {
    if (state.status == LaundryEmployeeRepairEventsTabStatus.error) {
      CleanDigitalToasts.of(context).showError(
        message: state.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocConsumer<LaundryEmployeeRepairEventsTabCubit,
          LaundryEmployeeRepairEventsTabState>(
        listener: _onStateChanged,
        builder: (context, state) {
          switch (state.status) {
            case LaundryEmployeeRepairEventsTabStatus.error:
              return ErrorView(onPressed: cubit.getRepairEvents);
            case LaundryEmployeeRepairEventsTabStatus.loading:
              return const Center(child: LoadingIndicator());
            case LaundryEmployeeRepairEventsTabStatus.success:
              return _buildSuccessBody(state);
          }
        },
      ),
    );
  }

  Widget _buildSuccessBody(LaundryEmployeeRepairEventsTabState state) {
    return Column(
      children: [
        const SizedBox(height: 16),
        TitleWithButton(
          title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
              '${state.totalElements}',
          onPressed: () {
            CleanDigitalDialogs.of(context)
                .showCreateRepairEventPage(cubit.createRepairEvent);
          },
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return RepairEventTile(repairEvent: state.repairEvents[index]);
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: state.totalElements,
          ),
        ),
      ],
    );
  }
}
