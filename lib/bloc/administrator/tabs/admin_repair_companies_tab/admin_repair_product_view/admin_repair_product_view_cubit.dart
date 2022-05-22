import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../models/repair_product.dart';
import '../../../../../services/repair_companies_service.dart';
import '../../../../base_cubit.dart';

part 'admin_repair_product_view_state.dart';

@injectable
class AdminRepairProductsViewCubit
    extends BaseCubit<AdminRepairProductsViewState> {
  final RepairCompaniesService _repairCompaniesService;
  late final String? _id;

  AdminRepairProductsViewCubit(
    this._repairCompaniesService,
    @factoryParam String? companyId,
  ) : super(const AdminRepairProductsViewState()) {
    _id = companyId;
    init();
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: AdminRepairProductsViewStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: AdminRepairProductsViewStatus.loading));
    log('init $_id');

    await makeErrorHandledCall(() async {
      emit(
        state.copyWith(
          products: await _repairCompaniesService.getCompanyProducts(_id!),
          status: AdminRepairProductsViewStatus.success,
        ),
      );
    });
  }
}
