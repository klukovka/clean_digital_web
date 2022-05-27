import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../bloc/administrator/admin_laundry_page/tabs/admin_employees_tab/admin_employees_tab_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../models/employee.dart';
import '../../../../utils/clean_digital_toasts.dart';
import '../../../../utils/pagination/pagination_utils.dart';
import '../../../../views/clean_digital_paged_grid_view.dart';
import '../../../../views/entity_tiles/employee_tile.dart';

class AdminEmployeesTab extends StatefulWidget implements AutoRouteWrapper {
  const AdminEmployeesTab({Key? key}) : super(key: key);

  @override
  State<AdminEmployeesTab> createState() => _AdminEmployeesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdminEmployeesTabCubit>(
        param1: RouteData.of(context).pathParams.getString('laundryId', ''),
      )..getEmployees(),
      child: this,
    );
  }
}

class _AdminEmployeesTabState extends State<AdminEmployeesTab> {
  late UniqueKey _paginatedListKey;

  AdminEmployeesTabCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();
    _paginatedListKey = UniqueKey();
  }

  Future<void> _fetchPage(int pageKey) async {
    await context.read<AdminEmployeesTabCubit>().getEmployees(page: pageKey);
  }

  void _onStateChanged(
    AdminEmployeesTabState state,
    PagingController<int, Employee> controller,
  ) {
    switch (state.status) {
      case AdminEmployeesTabStatus.success:
        controller.error = null;
        proccessNextPage<Employee>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.employees,
        );
        break;
      case AdminEmployeesTabStatus.error:
        controller.error = state.errorMessage;
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );

        break;
      case AdminEmployeesTabStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<AdminEmployeesTabCubit, AdminEmployeesTabState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              if (state.employees.isNotEmpty) _buildTitle(state),
              const SizedBox(height: 32),
              Expanded(
                child: Align(
                  alignment: state.employees.isEmpty
                      ? Alignment.center
                      : Alignment.topCenter,
                  child: _buildEmployeesGrid(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle(AdminEmployeesTabState state) {
    return Text(
      '${CleanDigitalLocalizations.of(context).totalAmount}: '
      '${state.totalElements}',
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }

  Widget _buildEmployeesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<Employee>(
        key: _paginatedListKey,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (employee) {
          return EmployeeTile(
            employee: employee,
            onDeletePressed: () async {
              await cubit.deteleEmployee(employee.user.userId);
              _paginatedListKey = UniqueKey();
            },
          );
        },
        builder: (pagedView, controller) {
          return BlocListener<AdminEmployeesTabCubit, AdminEmployeesTabState>(
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
