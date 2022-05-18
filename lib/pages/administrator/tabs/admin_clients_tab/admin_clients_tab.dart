import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../bloc/administrator/admin_clients_tab/admin_clients_tab_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../models/client.dart';
import '../../../../router/clean_digital_router.dart';
import '../../../../utils/pagination/pagination_utils.dart';
import '../../../../views/clean_digital_paged_grid_view.dart';
import '../../../../views/entity_tiles/client_tile.dart';

class AdminClientsTab extends StatefulWidget implements AutoRouteWrapper {
  const AdminClientsTab({Key? key}) : super(key: key);

  @override
  State<AdminClientsTab> createState() => _AdminClientsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdminClientsTabCubit>(),
      child: this,
    );
  }
}

class _AdminClientsTabState extends State<AdminClientsTab> with AutoRouteAware {
  AutoRouteObserver? _observer;
  late UniqueKey _paginatedListKey;

  AdminClientsTabCubit get cubit => context.read();

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
    await context.read<AdminClientsTabCubit>().getClients(page: pageKey);
  }

  void _onStateChanged(
    AdminClientsTabState state,
    PagingController<int, Client> controller,
  ) {
    switch (state.status) {
      case AdminClientsTabStatus.success:
        controller.error = null;
        proccessNextPage<Client>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.clients,
        );
        break;
      case AdminClientsTabStatus.error:
        controller.error = state.errorMessage;

        break;
      case AdminClientsTabStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<AdminClientsTabCubit, AdminClientsTabState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              if (state.clients.isNotEmpty) _buildTitle(state),
              const SizedBox(height: 32),
              Expanded(
                child: Align(
                  alignment: state.clients.isEmpty
                      ? Alignment.center
                      : Alignment.topCenter,
                  child: _buildClientsGrid(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle(AdminClientsTabState state) {
    return Text(
      '${CleanDigitalLocalizations.of(context).totalAmount}: '
      '${state.totalElements}',
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }

  Widget _buildClientsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<Client>(
        key: _paginatedListKey,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (client) {
          return ClientTile(
            client: client,
            onDeletePressed: () async {
              await cubit.deteleClient(client.user.userId);
              _paginatedListKey = UniqueKey();
            },
          );
        },
        builder: (pagedView, controller) {
          return BlocListener<AdminClientsTabCubit, AdminClientsTabState>(
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
