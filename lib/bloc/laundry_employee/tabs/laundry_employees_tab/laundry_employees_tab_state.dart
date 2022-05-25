part of 'laundry_employees_tab_cubit.dart';

enum LaundryEmployeesTabStatus {
  loading,
  error,
  success,
}

class LaundryEmployeesTabState extends Equatable {
  final LaundryEmployeesTabStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<Employee> employees;

  const LaundryEmployeesTabState({
    this.status = LaundryEmployeesTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.employees = const [],
  });

  LaundryEmployeesTabState copyWith({
    LaundryEmployeesTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<Employee>? employees,
  }) {
    return LaundryEmployeesTabState(
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
