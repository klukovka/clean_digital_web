import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../bloc/laundry_employee/tabs/laundry_employee_wash_machines_tab/laundry_employee_wash_machines_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../models/wash_machine.dart';
import '../../../router/clean_digital_router.dart';
import '../../../utils/clean_digital_dialogs.dart';
import '../../../utils/pagination/pagination_utils.dart';
import '../../../views/clean_digital_paged_grid_view.dart';
import '../../../views/entity_tiles/wash_machine_tile.dart';
import '../../../views/title_with_button.dart';

class LaundryEmployeeWashMachinesTab extends StatefulWidget
    implements AutoRouteWrapper {
  const LaundryEmployeeWashMachinesTab({Key? key}) : super(key: key);

  @override
  State<LaundryEmployeeWashMachinesTab> createState() =>
      _LaundryEmployeeWashMachinesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LaundryEmployeeWashMachinesTabCubit>(),
      child: this,
    );
  }
}

class _LaundryEmployeeWashMachinesTabState
    extends State<LaundryEmployeeWashMachinesTab> with AutoRouteAware {
  AutoRouteObserver? _observer;
  late UniqueKey _paginatedListKey;

  LaundryEmployeeWashMachinesTabCubit get cubit => context.read();

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
    cubit.reset();
    _paginatedListKey = UniqueKey();
  }

  @override
  void initState() {
    super.initState();
    _paginatedListKey = UniqueKey();
  }

  Future<void> _fetchPage(int pageKey) async {
    await context.read<LaundryEmployeeWashMachinesTabCubit>().getWashMachines(
          page: pageKey,
        );
  }

  void _onStateChanged(
    LaundryEmployeeWashMachinesTabState state,
    PagingController<int, WashMachine> controller,
  ) {
    switch (state.status) {
      case LaundryEmployeeWashMachinesTabStatus.success:
        controller.error = null;
        proccessNextPage<WashMachine>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.washMachines,
        );
        break;
      case LaundryEmployeeWashMachinesTabStatus.error:
        controller.error = state.errorMessage;

        break;
      case LaundryEmployeeWashMachinesTabStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<LaundryEmployeeWashMachinesTabCubit,
          LaundryEmployeeWashMachinesTabState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 32),
              if (state.washMachines.isNotEmpty) _buildTitle(state),
              const SizedBox(height: 32),
              Expanded(
                child: Align(
                  alignment: state.washMachines.isEmpty
                      ? Alignment.center
                      : Alignment.topCenter,
                  child: _buildLaundriesGrid(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle(LaundryEmployeeWashMachinesTabState state) {
    return TitleWithButton(
      title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
          '${state.totalElements}',
      onPressed: () {
        CleanDigitalDialogs.of(context).showRegisterWashMachineDialog(
          (request) async {
            await cubit.createWashMachine(request);
            _paginatedListKey = UniqueKey();
          },
        );
      },
    );
  }

  Widget _buildLaundriesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<WashMachine>(
        key: _paginatedListKey,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (washMachine) {
          return WashMachineTile(
            washMachine: washMachine,
            isEdit: true,
            onMorePressed: () async {
              CleanDigitalDialogs.of(context).showEditWashMachineDialog(
                washMachine,
                (value) async {
                  await cubit.updateWashMachine(
                      washMachine.washMachineId, value);
                  _paginatedListKey = UniqueKey();
                },
              );
            },
            onDeletePressed: () async {
              await cubit.deleteWashMachine(washMachine.washMachineId);
              _paginatedListKey = UniqueKey();
            },
          );
        },
        builder: (pagedView, controller) {
          return BlocListener<LaundryEmployeeWashMachinesTabCubit,
              LaundryEmployeeWashMachinesTabState>(
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
