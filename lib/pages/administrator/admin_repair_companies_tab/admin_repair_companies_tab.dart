import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../bloc/administrator/admin_repair_companies_tab/admin_repair_companies_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../models/repair_company.dart';
import '../../../router/clean_digital_router.dart';
import '../../../utils/clean_digital_dialogs.dart';
import '../../../utils/pagination/pagination_utils.dart';
import '../../../views/clean_digital_paged_grid_view.dart';
import '../../../views/entity_tiles/repair_company_tile.dart';
import '../../../views/title_with_button.dart';

class AdminRepairCompaniesTab extends StatefulWidget
    implements AutoRouteWrapper {
  const AdminRepairCompaniesTab({Key? key}) : super(key: key);

  @override
  State<AdminRepairCompaniesTab> createState() =>
      _AdminRepairCompaniesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdminRepairCompaniesTabCubit>(),
      child: this,
    );
  }
}

class _AdminRepairCompaniesTabState extends State<AdminRepairCompaniesTab>
    with AutoRouteAware {
  AutoRouteObserver? _observer;
  late UniqueKey _paginatedListKey;

  AdminRepairCompaniesTabCubit get cubit => context.read();

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
    await context
        .read<AdminRepairCompaniesTabCubit>()
        .getRepairCompanies(page: pageKey);
  }

  void _onStateChanged(
    AdminRepairCompaniesTabState state,
    PagingController<int, RepairCompany> controller,
  ) {
    switch (state.status) {
      case AdminRepairCompaniesTabStatus.success:
        controller.error = null;
        proccessNextPage<RepairCompany>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.repairCompanies,
        );
        break;
      case AdminRepairCompaniesTabStatus.error:
        controller.error = state.errorMessage;

        break;
      case AdminRepairCompaniesTabStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<AdminRepairCompaniesTabCubit,
          AdminRepairCompaniesTabState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 32),
              if (state.repairCompanies.isNotEmpty) _buildTitle(state),
              const SizedBox(height: 32),
              Expanded(
                child: Align(
                  alignment: state.repairCompanies.isEmpty
                      ? Alignment.center
                      : Alignment.topCenter,
                  child: _buildRepairCompaniesGrid(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle(AdminRepairCompaniesTabState state) {
    return TitleWithButton(
      title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
          '${state.totalElements}',
      onPressed: () {
        CleanDigitalDialogs.of(context).showRegisterRepairCompanyDialog(
          (request) async {
            await cubit.createRepairCompany(request);
            _paginatedListKey = UniqueKey();
          },
        );
      },
    );
  }

  Widget _buildRepairCompaniesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<RepairCompany>(
        key: _paginatedListKey,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (company) {
          return RepairCompanyTile(
            company: company,
            onDeletePressed: () async {
              await cubit.deteleRepairCompany(company.user.userId);
              _paginatedListKey = UniqueKey();
            },
          );
        },
        builder: (pagedView, controller) {
          return BlocListener<AdminRepairCompaniesTabCubit,
              AdminRepairCompaniesTabState>(
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
