import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/repair_company.dart';
import '../../../services/repair_companies_service.dart';
import '../../base_cubit.dart';

part 'admin_repair_companies_tab_state.dart';

@injectable
class AdminRepairCompaniesTabCubit
    extends BaseCubit<AdminRepairCompaniesTabState> {
  final RepairCompaniesService _repairCompaniesService;

  AdminRepairCompaniesTabCubit(
    this._repairCompaniesService,
  ) : super(const AdminRepairCompaniesTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminRepairCompaniesTabStatus.error,
    ));
  }

  Future<void> getRepairCompanies({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: AdminRepairCompaniesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final repairCompanies =
          await _repairCompaniesService.getAllRepairCompanies(
        page: page,
      );
      emit(state.copyWith(
        status: AdminRepairCompaniesTabStatus.success,
        totalPages: repairCompanies.totalPages,
        repairCompanies: repairCompanies.companies,
        totalElements: repairCompanies.totalElements,
      ));
    });
  }

  // Future<void> createRepairCompany(
  //     CreateUpdateRepairCompanyRequest request) async {
  //   emit(state.copyWith(status: AdminRepairCompaniesTabStatus.loading));
  //   await makeErrorHandledCall(() async {
  //     await _laundriesService.createRepairCompany(request);
  //   });
  //   await getRepairCompanies();
  // }
}
