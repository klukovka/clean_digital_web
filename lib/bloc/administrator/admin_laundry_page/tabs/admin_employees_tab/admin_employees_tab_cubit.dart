import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../models/employee.dart';
import '../../../../../services/auth_service.dart';
import '../../../../../services/laundries_service.dart';
import '../../../../base_cubit.dart';

part 'admin_employees_tab_state.dart';

@injectable
class AdminEmployeesTabCubit extends BaseCubit<AdminEmployeesTabState> {
  final LaundriesService _laundriesService;
  final AuthService _authService;
  late final String _laundryId;

  AdminEmployeesTabCubit(
    this._laundriesService,
    this._authService,
    @factoryParam String? laundryId,
  ) : super(const AdminEmployeesTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminEmployeesTabStatus.error,
    ));
  }

  void reset() {
    emit(const AdminEmployeesTabState());
  }

  Future<void> getEmployees({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: AdminEmployeesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final employees = await _laundriesService.getLaundryEmployees(
        laundryId: _laundryId,
        page: page,
      );
      emit(state.copyWith(
        status: AdminEmployeesTabStatus.success,
        totalPages: employees.totalPages,
        employees: employees.employees,
        totalElements: employees.totalElements,
      ));
    });
  }

  Future<void> deteleEmployee(String userId) async {
    emit(state.copyWith(status: AdminEmployeesTabStatus.loading));
    await makeErrorHandledCall(() async {
      await _authService.deleteUser(userId);
    });
    reset();
  }
}
