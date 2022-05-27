import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../api/models/create_update_requests/create_update_repair_company.dart';
import '../../../models/repair_company.dart';
import '../../../services/auth_service.dart';
import '../../../services/repair_companies_service.dart';
import '../../base_cubit.dart';

part 'repair_company_settings_tab_state.dart';

@injectable
class RepairCompanySettingsTabCubit
    extends BaseCubit<RepairCompanySettingsTabState> {
  final RepairCompaniesService _repairCompantService;
  final AuthService _authService;

  RepairCompanySettingsTabCubit(
    this._repairCompantService,
    this._authService,
  ) : super(const RepairCompanySettingsTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: RepairCompanySettingsTabStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: RepairCompanySettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      final repairCompany = await _repairCompantService.getRepairCompanyInfo();
      emit(state.copyWith(
        status: RepairCompanySettingsTabStatus.success,
        repairCompany: repairCompany,
      ));
    });
  }

  Future<void> updateRepairCompany(
    CreateUpdateRepairCompanyRequest request,
  ) async {
    emit(state.copyWith(status: RepairCompanySettingsTabStatus.loading));
    await makeErrorHandledCall(() async {
      await _repairCompantService.updateRepairCompany(request);
      await init();
    });
  }

  Future<void> delete() async {
    emit(state.copyWith(status: RepairCompanySettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.deleteAccount();
      emit(state.copyWith(status: RepairCompanySettingsTabStatus.deleted));
    });
  }

  Future<void> updatePassword(String password, String newPassword) async {
    emit(state.copyWith(status: RepairCompanySettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.updatePassword(newPassword, password);
      await init();
    });
  }
}
