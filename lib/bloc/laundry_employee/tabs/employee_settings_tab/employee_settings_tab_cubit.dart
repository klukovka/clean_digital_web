import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/employee.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/laundries_service.dart';
import '../../../base_cubit.dart';

part 'employee_settings_tab_state.dart';

@injectable
class EmployeeSettingsTabCubit extends BaseCubit<EmployeeSettingsTabState> {
  final LaundriesService _laundriesService;
  final AuthService _authService;

  EmployeeSettingsTabCubit(
    this._laundriesService,
    this._authService,
  ) : super(EmployeeSettingsTabState(
          employee: Employee.empty(),
        ));

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: EmployeeSettingsTabStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: EmployeeSettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      final employee = await _laundriesService.getEmployeePersonalInfo();
      emit(state.copyWith(
        status: EmployeeSettingsTabStatus.success,
        employee: employee,
      ));
    });
  }

  Future<void> delete() async {
    emit(state.copyWith(status: EmployeeSettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.deleteAccount();
      emit(state.copyWith(status: EmployeeSettingsTabStatus.deleted));
    });
  }

  Future<void> updatePassword(String password, String newPassword) async {
    emit(state.copyWith(status: EmployeeSettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.updatePassword(newPassword, password);
      await init();
    });
  }
}
