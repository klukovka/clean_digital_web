import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/repair_company/repair_events_tab/repair_events_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../router/clean_digital_router.dart';
import '../../../utils/clean_digital_toasts.dart';
import '../../../views/entity_tiles/repair_event_tile.dart';
import '../../../views/error_view.dart';
import '../../../views/loading_indicator.dart';
import '../../../views/title_with_button.dart';

class RepairEventsTab extends StatefulWidget with AutoRouteWrapper {
  const RepairEventsTab({Key? key}) : super(key: key);

  @override
  State<RepairEventsTab> createState() => _RepairEventsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<RepairEventsTabCubit>()..getRepairEvents(),
      child: this,
    );
  }
}

class _RepairEventsTabState extends State<RepairEventsTab> with AutoRouteAware {
  AutoRouteObserver? _observer;
  RepairEventsTabCubit get cubit => context.read();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _observer = router.getObserver<AutoRouteObserver>(context);
    if (_observer != null) {
      _observer?.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    _observer?.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeTabRoute(TabPageRoute tabPageRoute) {
    cubit.getRepairEvents();
  }

  void _onStateChanged(
    BuildContext context,
    RepairEventsTabState state,
  ) {
    if (state.status == RepairEventsTabStatus.error) {
      CleanDigitalToasts.of(context).showError(
        message: state.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocConsumer<RepairEventsTabCubit, RepairEventsTabState>(
        listener: _onStateChanged,
        builder: (context, state) {
          switch (state.status) {
            case RepairEventsTabStatus.error:
              return ErrorView(onPressed: cubit.getRepairEvents);
            case RepairEventsTabStatus.loading:
              return const Center(child: LoadingIndicator());
            case RepairEventsTabStatus.success:
              return _buildSuccessBody(state);
          }
        },
      ),
    );
  }

  Widget _buildSuccessBody(RepairEventsTabState state) {
    return Column(
      children: [
        const SizedBox(height: 16),
        TitleWithButton(
          title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
              '${state.totalElements}',
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return RepairEventTile(
                repairEvent: state.repairEvents[index],
                onMorePressed: state.repairEvents[index].done
                    ? () {
                        cubit.doneRepairEvent(
                          state.repairEvents[index].repairEventId,
                        );
                      }
                    : null,
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: state.totalElements,
          ),
        ),
      ],
    );
  }
}
