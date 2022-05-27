import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../api/models/create_update_requests/create_update_repair_product.dart';
import '../../../models/repair_product.dart';
import '../../../services/repair_companies_service.dart';
import '../../base_cubit.dart';

part 'repair_products_tab_state.dart';

@injectable
class RepairProductsTabCubit extends BaseCubit<RepairProductsTabState> {
  final RepairCompaniesService _companyService;

  RepairProductsTabCubit(
    this._companyService,
  ) : super(const RepairProductsTabState());

  get getRepairEvents => null;

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: RepairProductsTabStatus.error,
    ));
  }

  Future<void> getRepairProducts() async {
    emit(state.copyWith(status: RepairProductsTabStatus.loading));
    await makeErrorHandledCall(() async {
      final repairProducts = await _companyService.getCompanyOwnProducts();
      emit(state.copyWith(
        status: RepairProductsTabStatus.success,
        repairProducts: repairProducts.products,
        totalElements: repairProducts.totalElements,
      ));
    });
  }

  Future<void> createRepairProduct(
    CreateUpdateRepairProductRequest request,
  ) async {
    emit(state.copyWith(
      status: RepairProductsTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _companyService.createRepairProduct(request);
    });
    getRepairProducts();
  }

  Future<void> updateRepairProduct(
    String repairProductId,
    CreateUpdateRepairProductRequest request,
  ) async {
    emit(state.copyWith(
      status: RepairProductsTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _companyService.updateRepairProduct(
        repairProductId,
        request,
      );
    });
    getRepairProducts();
  }

  Future<void> deleteRepairProduct(String repairProductId) async {
    emit(state.copyWith(
      status: RepairProductsTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _companyService.deleteRepairProduct(repairProductId);
    });
    getRepairProducts();
  }
}
