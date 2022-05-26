part of 'employee_settings_tab_cubit.dart';

enum EmployeeSettingsTabStatus {
  loading,
  success,
  error,
  deleted,
}

class EmployeeSettingsTabState extends Equatable {
  final EmployeeSettingsTabStatus status;
  final String errorMessage;
  final Employee employee;

  const EmployeeSettingsTabState({
    required this.employee,
    this.status = EmployeeSettingsTabStatus.loading,
    this.errorMessage = '',
  });

  EmployeeSettingsTabState copyWith({
    EmployeeSettingsTabStatus? status,
    String? errorMessage,
    Employee? employee,
  }) {
    return EmployeeSettingsTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      employee: employee ?? this.employee,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, employee];
}
