import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../bloc/administrator/tabs/admin_laundries_tab/admin_laundries_tab_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../models/laundry.dart';
import '../../../../router/clean_digital_router.dart';
import '../../../../utils/clean_digital_dialogs.dart';
import '../../../../utils/pagination/pagination_utils.dart';
import '../../../../views/clean_digital_paged_grid_view.dart';
import '../../../../views/entity_tiles/laundry_tile.dart';
import '../../../../views/title_with_button.dart';

class AdminLaundriesTab extends StatefulWidget implements AutoRouteWrapper {
  const AdminLaundriesTab({Key? key}) : super(key: key);

  @override
  State<AdminLaundriesTab> createState() => _AdminLaundriesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdminLaundriesTabCubit>(),
      child: this,
    );
  }
}

class _AdminLaundriesTabState extends State<AdminLaundriesTab>
    with AutoRouteAware {
  AutoRouteObserver? _observer;
  late UniqueKey _paginatedListKey;

  AdminLaundriesTabCubit get cubit => context.read();

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
    await context.read<AdminLaundriesTabCubit>().getLaundries(page: pageKey);
  }

  void _onStateChanged(
    AdminLaundriesTabState state,
    PagingController<int, Laundry> controller,
  ) {
    switch (state.status) {
      case AdminLaundriesTabStatus.success:
        controller.error = null;
        proccessNextPage<Laundry>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.laundries,
        );
        break;
      case AdminLaundriesTabStatus.error:
        controller.error = state.errorMessage;

        break;
      case AdminLaundriesTabStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<AdminLaundriesTabCubit, AdminLaundriesTabState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 32),
              if (state.laundries.isNotEmpty) _buildTitle(state),
              const SizedBox(height: 32),
              Expanded(
                child: Align(
                  alignment: state.laundries.isEmpty
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

  Widget _buildTitle(AdminLaundriesTabState state) {
    return TitleWithButton(
      title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
          '${state.totalElements}',
      onPressed: () {
        CleanDigitalDialogs.of(context).showRegisterLaundryDialog(
          (request) async {
            await cubit.createLaundry(request);
            _paginatedListKey = UniqueKey();
          },
        );
      },
    );
  }

  Widget _buildLaundriesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<Laundry>(
        key: _paginatedListKey,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (laundry) {
          return LaundryTile(
            laundry: laundry,
            onDeletePressed: () async {
              await cubit.deteleLaundry(laundry.user.userId);
              _paginatedListKey = UniqueKey();
            },
          );
        },
        builder: (pagedView, controller) {
          return BlocListener<AdminLaundriesTabCubit, AdminLaundriesTabState>(
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
