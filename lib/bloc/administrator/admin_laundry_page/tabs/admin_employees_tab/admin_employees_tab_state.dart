part of 'admin_employees_tab_cubit.dart';

enum AdminEmployeesTabStatus {
  loading,
  error,
  success,
}

class AdminEmployeesTabState extends Equatable {
  final AdminEmployeesTabStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<Employee> employees;

  const AdminEmployeesTabState({
    this.status = AdminEmployeesTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.employees = const [],
  });

  AdminEmployeesTabState copyWith({
    AdminEmployeesTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<Employee>? employees,
  }) {
    return AdminEmployeesTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      employees: employees ?? this.employees,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      page,
      totalPages,
      totalElements,
      employees,
    ];
  }
}
