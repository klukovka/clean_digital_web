import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../bloc/laundry_employee/tabs/laundry_employees_tab/laundry_employees_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../models/employee.dart';
import '../../../utils/clean_digital_dialogs.dart';
import '../../../utils/clean_digital_toasts.dart';
import '../../../utils/pagination/pagination_utils.dart';
import '../../../views/clean_digital_paged_grid_view.dart';
import '../../../views/entity_tiles/employee_tile.dart';
import '../../../views/title_with_button.dart';

class LaundryEmployeesTab extends StatefulWidget implements AutoRouteWrapper {
  const LaundryEmployeesTab({Key? key}) : super(key: key);

  @override
  State<LaundryEmployeesTab> createState() => _LaundryEmployeesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LaundryEmployeesTabCubit>(),
      child: this,
    );
  }
}

class _LaundryEmployeesTabState extends State<LaundryEmployeesTab> {
  late UniqueKey _paginatedListKey;

  LaundryEmployeesTabCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();
    _paginatedListKey = UniqueKey();
  }

  Future<void> _fetchPage(int pageKey) async {
    await context.read<LaundryEmployeesTabCubit>().getEmployees(page: pageKey);
  }

  void _onStateChanged(
    LaundryEmployeesTabState state,
    PagingController<int, Employee> controller,
  ) {
    switch (state.status) {
      case LaundryEmployeesTabStatus.success:
        controller.error = null;
        proccessNextPage<Employee>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.employees,
        );
        break;
      case LaundryEmployeesTabStatus.error:
        controller.error = state.errorMessage;
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case LaundryEmployeesTabStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<LaundryEmployeesTabCubit, LaundryEmployeesTabState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 32),
              _buildTitle(state),
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

  Widget _buildTitle(LaundryEmployeesTabState state) {
    return TitleWithButton(
      title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
          '${state.totalElements}',
      onPressed: () {
        CleanDigitalDialogs.of(context).showRegisterEmployeeDialog(
          (request) async {
            await cubit.createEmployee(request);
            _paginatedListKey = UniqueKey();
          },
        );
      },
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
              await cubit.deleteEmployee(employee.user.userId);
              _paginatedListKey = UniqueKey();
            },
          );
        },
        builder: (pagedView, controller) {
          return BlocListener<LaundryEmployeesTabCubit,
              LaundryEmployeesTabState>(
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
