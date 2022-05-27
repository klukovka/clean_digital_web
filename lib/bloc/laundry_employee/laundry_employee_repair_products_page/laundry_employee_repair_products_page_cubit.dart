import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/repair_product.dart';
import '../../../services/repair_companies_service.dart';
import '../../base_cubit.dart';

part 'laundry_employee_repair_products_page_state.dart';

@injectable
class LaundryEmployeeRepairProductsPageCubit
    extends BaseCubit<LaundryEmployeeRepairProductsPageState> {
  final RepairCompaniesService _companiesService;

  LaundryEmployeeRepairProductsPageCubit(
    this._companiesService,
  ) : super(const LaundryEmployeeRepairProductsPageState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: LaundryEmployeeRepairProductsPageStatus.error,
    ));
  }

  void reset() {
    emit(const LaundryEmployeeRepairProductsPageState());
  }

  Future<void> getProducts({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: LaundryEmployeeRepairProductsPageStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final products = await _companiesService.getAllProducts(
        page: page,
      );
      emit(state.copyWith(
        status: LaundryEmployeeRepairProductsPageStatus.success,
        totalPages: products.totalPages,
        products: products.products,
        totalElements: products.totalElements,
      ));
    });
  }
}
