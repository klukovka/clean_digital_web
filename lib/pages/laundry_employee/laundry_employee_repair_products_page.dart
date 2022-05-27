import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../bloc/laundry_employee/laundry_employee_repair_products_page/laundry_employee_repair_products_page_cubit.dart';
import '../../di/injection_container.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/repair_product.dart';
import '../../utils/pagination/pagination_utils.dart';
import '../../views/clean_digital_paged_grid_view.dart';
import '../../views/entity_tiles/repair_product_tile.dart';

class LaundryEmployeeRepairProductsPage extends StatefulWidget
    with AutoRouteWrapper {
  final ValueSetter<RepairProduct> onChosen;

  const LaundryEmployeeRepairProductsPage({
    Key? key,
    required this.onChosen,
  }) : super(key: key);

  @override
  State<LaundryEmployeeRepairProductsPage> createState() =>
      _LaundryEmployeeRepairProductsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LaundryEmployeeRepairProductsPageCubit>(),
      child: this,
    );
  }
}

class _LaundryEmployeeRepairProductsPageState
    extends State<LaundryEmployeeRepairProductsPage> {
  late UniqueKey _paginatedListKey;

  LaundryEmployeeRepairProductsPageCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();
    _paginatedListKey = UniqueKey();
  }

  Future<void> _fetchPage(int pageKey) async {
    await context
        .read<LaundryEmployeeRepairProductsPageCubit>()
        .getProducts(page: pageKey);
  }

  void _onStateChanged(
    LaundryEmployeeRepairProductsPageState state,
    PagingController<int, RepairProduct> controller,
  ) {
    switch (state.status) {
      case LaundryEmployeeRepairProductsPageStatus.success:
        controller.error = null;
        proccessNextPage<RepairProduct>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.products,
        );
        break;
      case LaundryEmployeeRepairProductsPageStatus.error:
        controller.error = state.errorMessage;

        break;
      case LaundryEmployeeRepairProductsPageStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CleanDigitalLocalizations.of(context).chooseOne),
      ),
      body: BlocBuilder<LaundryEmployeeRepairProductsPageCubit,
          LaundryEmployeeRepairProductsPageState>(builder: (context, state) {
        return Align(
          alignment:
              state.products.isEmpty ? Alignment.center : Alignment.topCenter,
          child: _buildProductsGrid(),
        );
      }),
    );
  }

  Widget _buildProductsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<RepairProduct>(
        key: _paginatedListKey,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (repairProduct) {
          return RepairProductTile(
            repairProduct: repairProduct,
            moreText: CleanDigitalLocalizations.of(context).choose,
            onMorePressed: () => widget.onChosen(repairProduct),
          );
        },
        builder: (pagedView, controller) {
          return BlocListener<LaundryEmployeeRepairProductsPageCubit,
              LaundryEmployeeRepairProductsPageState>(
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
