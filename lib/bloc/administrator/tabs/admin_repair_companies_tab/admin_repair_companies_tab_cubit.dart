import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api/models/create_update_requests/create_update_repair_company.dart';
import '../../../../models/repair_company.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/repair_companies_service.dart';
import '../../../base_cubit.dart';

part 'admin_repair_companies_tab_state.dart';

@injectable
class AdminRepairCompaniesTabCubit
    extends BaseCubit<AdminRepairCompaniesTabState> {
  final RepairCompaniesService _repairCompaniesService;
  final AuthService _authService;

  AdminRepairCompaniesTabCubit(
    this._repairCompaniesService,
    this._authService,
  ) : super(const AdminRepairCompaniesTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminRepairCompaniesTabStatus.error,
    ));
  }

  void reset() {
    emit(const AdminRepairCompaniesTabState());
  }

  Future<void> getRepairCompanies({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: AdminRepairCompaniesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final companies = await _repairCompaniesService.getAllRepairCompanies(
        page: page,
      );
      emit(state.copyWith(
        status: AdminRepairCompaniesTabStatus.success,
        totalPages: companies.totalPages,
        repairCompanies: companies.companies,
        totalElements: companies.totalElements,
      ));
    });
  }

  Future<void> createRepairCompany(
    CreateUpdateRepairCompanyRequest request,
  ) async {
    emit(state.copyWith(status: AdminRepairCompaniesTabStatus.loading));
    await makeErrorHandledCall(() async {
      await _repairCompaniesService.createRepairCompany(request);
    });
    reset();
  }

  Future<void> deteleRepairCompany(String userId) async {
    emit(state.copyWith(status: AdminRepairCompaniesTabStatus.loading));
    await makeErrorHandledCall(() async {
      await _authService.deleteUser(userId);
    });
    reset();
  }

  Future<void> selectCompany(RepairCompany company) async {
    emit(state.closeCompany());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.copyWith(
      selectedCompany: company,
      repairCompanies: <RepairCompany>[],
    ));
  }

  void closeCompany() {
    emit(state.closeCompany());
  }
}
