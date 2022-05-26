import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../bloc/laundry_employee/tabs/laundry_employee_events_tab/laundry_employee_events_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../models/event.dart';
import '../../../utils/pagination/pagination_utils.dart';
import '../../../views/clean_digital_paged_grid_view.dart';
import '../../../views/entity_tiles/event_tile.dart';

class LaundryEmployeeEventsTab extends StatefulWidget
    implements AutoRouteWrapper {
  const LaundryEmployeeEventsTab({Key? key}) : super(key: key);

  @override
  State<LaundryEmployeeEventsTab> createState() =>
      _LaundryEmployeeEventsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LaundryEmployeeEventsTabCubit>()..getEvents(),
      child: this,
    );
  }
}

class _LaundryEmployeeEventsTabState extends State<LaundryEmployeeEventsTab> {
  late UniqueKey _paginatedListKey;

  LaundryEmployeeEventsTabCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();
    _paginatedListKey = UniqueKey();
  }

  Future<void> _fetchPage(int pageKey) async {
    await context
        .read<LaundryEmployeeEventsTabCubit>()
        .getEvents(page: pageKey);
  }

  void _onStateChanged(
    LaundryEmployeeEventsTabState state,
    PagingController<int, Event> controller,
  ) {
    switch (state.status) {
      case LaundryEmployeeEventsTabStatus.success:
        controller.error = null;
        proccessNextPage<Event>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.events,
        );
        break;
      case LaundryEmployeeEventsTabStatus.error:
        controller.error = state.errorMessage;

        break;
      case LaundryEmployeeEventsTabStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<LaundryEmployeeEventsTabCubit,
          LaundryEmployeeEventsTabState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              if (state.events.isNotEmpty) _buildTitle(state),
              const SizedBox(height: 32),
              Expanded(
                child: Align(
                  alignment: state.events.isEmpty
                      ? Alignment.center
                      : Alignment.topCenter,
                  child: _buildEventsGrid(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle(LaundryEmployeeEventsTabState state) {
    return Text(
      '${CleanDigitalLocalizations.of(context).totalAmount}: '
      '${state.totalElements}',
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }

  Widget _buildEventsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<Event>(
        key: _paginatedListKey,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (event) {
          return EventTile(event: event);
        },
        builder: (pagedView, controller) {
          return BlocListener<LaundryEmployeeEventsTabCubit,
              LaundryEmployeeEventsTabState>(
            listener: (context, state) {
              _onStateChanged(state, controller);
            },
            child: pagedView,
          );
        },
        noItemsFoundIndicator: Text(
          CleanDigitalLocalizations.of(context).noMoreItems,
        ),
      ),
    );
  }
}
