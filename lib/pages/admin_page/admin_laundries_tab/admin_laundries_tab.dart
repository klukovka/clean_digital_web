import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../bloc/admin_page/admin_laundres_tab/admin_laundres_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../models/laundry.dart';
import '../../../utils/pagination/pagination_utils.dart';
import '../../../views/clean_digital_paged_grid_view.dart';

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

class _AdminLaundriesTabState extends State<AdminLaundriesTab> {
  late UniqueKey _paginatedListKey;

  AdminLaundriesTabCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();
    _paginatedListKey = UniqueKey();
  }

  Future<void> _fetchPage(int pageKey) async {
    await context.read<AdminLaundriesTabCubit>().getSitters(page: pageKey);
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
    return BlocBuilder<AdminLaundriesTabCubit, AdminLaundriesTabState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                const SizedBox(height: 32),
                if (state.laundries.isNotEmpty)
                  Text(
                    '${CleanDigitalLocalizations.of(context).totalAmount}: '
                    '${state.totalElements}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
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
            ),
          ],
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
          return Text(laundry.name);
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
