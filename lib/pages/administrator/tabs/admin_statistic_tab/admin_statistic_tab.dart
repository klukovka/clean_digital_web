import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';

import '../../../../bloc/administrator/tabs/admin_statistic_tab/admin_statistic_tab_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../models/statistic/all_laundry_statistic.dart';
import '../../../../router/clean_digital_router.dart';
import '../../../../utils/clean_digital_toasts.dart';
import '../../../../utils/pagination/pagination_utils.dart';
import '../../../../views/clean_digital_paged_grid_view.dart';
import 'view/statistic_tile.dart';
import 'view/statistic_view.dart';

class AdminStatisticTab extends StatefulWidget with AutoRouteWrapper {
  const AdminStatisticTab({Key? key}) : super(key: key);

  @override
  State<AdminStatisticTab> createState() => _AdminStatisticTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdminStatisticTabCubit>(),
      child: this,
    );
  }
}

class _AdminStatisticTabState extends State<AdminStatisticTab>
    with AutoRouteAware {
  AutoRouteObserver? _observer;
  late UniqueKey _paginatedListKey;

  AdminStatisticTabCubit get cubit => context.read();

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
    await context.read<AdminStatisticTabCubit>().getStatistic(page: pageKey);
  }

  void _onStateChanged(
    AdminStatisticTabState state,
    PagingController<int, AllLaundryStatistic> controller,
  ) {
    switch (state.status) {
      case AdminStatisticTabStatus.success:
        controller.error = null;
        proccessNextPage<AllLaundryStatistic>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.statistic,
        );
        break;
      case AdminStatisticTabStatus.error:
        controller.error = state.errorMessage;
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case AdminStatisticTabStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<AdminStatisticTabCubit, AdminStatisticTabState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(child: _buildList(state)),
              StatisticView(
                laundryStatistic: state.selectedLaundry,
                onPressed: cubit.closeLaunry,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildList(AdminStatisticTabState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        if (state.statistic.isNotEmpty) _buildTitle(state),
        const SizedBox(height: 32),
        Expanded(
          child: Align(
            alignment: state.statistic.isEmpty
                ? Alignment.center
                : Alignment.topCenter,
            child: _buildClientsGrid(state),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(AdminStatisticTabState state) {
    return Text(
      '${CleanDigitalLocalizations.of(context).totalAmount}: '
      '${state.totalElements}',
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }

  Widget _buildClientsGrid(AdminStatisticTabState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<AllLaundryStatistic>(
        key: _paginatedListKey,
        width: state.selectedLaundry != null ? 70.w : 100.w,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (statistic) {
          return StatisticTile(
            statistic: statistic,
            onPressed: cubit.selectLaundry,
          );
        },
        builder: (pagedView, controller) {
          return BlocListener<AdminStatisticTabCubit, AdminStatisticTabState>(
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
