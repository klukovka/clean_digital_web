import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../api/models/create_update_requests/create_update_employee.dart';
import '../../../../models/employee.dart';
import '../../../../services/laundries_service.dart';
import '../../../base_cubit.dart';

part 'laundry_employees_tab_state.dart';

@injectable
class LaundryEmployeesTabCubit extends BaseCubit<LaundryEmployeesTabState> {
  final LaundriesService _laundriesService;

  LaundryEmployeesTabCubit(
    this._laundriesService,
  ) : super(const LaundryEmployeesTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: LaundryEmployeesTabStatus.error,
    ));
  }

  void reset() {
    emit(const LaundryEmployeesTabState());
  }

  Future<void> getEmployees({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: LaundryEmployeesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final employees = await _laundriesService.getLaundryOwnEmployees(
        page: page,
      );
      emit(state.copyWith(
        status: LaundryEmployeesTabStatus.success,
        totalPages: employees.totalPages,
        employees: employees.employees,
        totalElements: employees.totalElements,
      ));
    });
  }

  Future<void> deteleEmployee(String userId) async {
    emit(state.copyWith(status: LaundryEmployeesTabStatus.loading));
    await makeErrorHandledCall(() async {
      await _laundriesService.deleteEmployee(userId);
    });
    reset();
  }

  Future<void> createEmployee(
    CreateUpdateEmployeeRequest employee,
  ) async {
    emit(state.copyWith(
      status: LaundryEmployeesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.createEmployee(employee);
    });
    reset();
  }

  Future<void> deleteEmployee(String userId) async {
    emit(state.copyWith(
      status: LaundryEmployeesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.deleteEmployee(userId);
    });
    reset();
  }
}
