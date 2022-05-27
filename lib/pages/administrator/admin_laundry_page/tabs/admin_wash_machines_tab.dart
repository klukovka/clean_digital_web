import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../bloc/administrator/admin_laundry_page/tabs/admin_wash_machines_tab/admin_wash_machines_tab_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../models/wash_machine.dart';
import '../../../../utils/clean_digital_toasts.dart';
import '../../../../utils/pagination/pagination_utils.dart';
import '../../../../views/clean_digital_paged_grid_view.dart';
import '../../../../views/entity_tiles/wash_machine_tile.dart';

class AdminWashMachinesTab extends StatefulWidget implements AutoRouteWrapper {
  const AdminWashMachinesTab({Key? key}) : super(key: key);

  @override
  State<AdminWashMachinesTab> createState() => _AdminWashMachinesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdminWashMachinesTabCubit>(
        param1: RouteData.of(context).pathParams.getString('laundryId', ''),
      )..getWashMachines(),
      child: this,
    );
  }
}

class _AdminWashMachinesTabState extends State<AdminWashMachinesTab> {
  late UniqueKey _paginatedListKey;

  AdminWashMachinesTabCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();
    _paginatedListKey = UniqueKey();
  }

  Future<void> _fetchPage(int pageKey) async {
    await context
        .read<AdminWashMachinesTabCubit>()
        .getWashMachines(page: pageKey);
  }

  void _onStateChanged(
    AdminWashMachinesTabState state,
    PagingController<int, WashMachine> controller,
  ) {
    switch (state.status) {
      case AdminWashMachinesTabStatus.success:
        controller.error = null;
        proccessNextPage<WashMachine>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.washMachines,
        );
        break;
      case AdminWashMachinesTabStatus.error:
        controller.error = state.errorMessage;
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case AdminWashMachinesTabStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<AdminWashMachinesTabCubit, AdminWashMachinesTabState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              if (state.washMachines.isNotEmpty) _buildTitle(state),
              const SizedBox(height: 32),
              Expanded(
                child: Align(
                  alignment: state.washMachines.isEmpty
                      ? Alignment.center
                      : Alignment.topCenter,
                  child: _buildWashMachinesGrid(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle(AdminWashMachinesTabState state) {
    return Text(
      '${CleanDigitalLocalizations.of(context).totalAmount}: '
      '${state.totalElements}',
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }

  Widget _buildWashMachinesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<WashMachine>(
        key: _paginatedListKey,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (washMachine) {
          return WashMachineTile(washMachine: washMachine);
        },
        builder: (pagedView, controller) {
          return BlocListener<AdminWashMachinesTabCubit,
              AdminWashMachinesTabState>(
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
