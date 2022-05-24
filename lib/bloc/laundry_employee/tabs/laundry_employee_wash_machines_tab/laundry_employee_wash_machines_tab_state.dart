part of 'laundry_employee_wash_machines_tab_cubit.dart';

enum LaundryEmployeeWashMachinesTabStatus {
  loading,
  error,
  success,
}

class LaundryEmployeeWashMachinesTabState extends Equatable {
  final LaundryEmployeeWashMachinesTabStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<WashMachine> washMachines;

  const LaundryEmployeeWashMachinesTabState({
    this.status = LaundryEmployeeWashMachinesTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.washMachines = const [],
  });

  LaundryEmployeeWashMachinesTabState copyWith({
    LaundryEmployeeWashMachinesTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<WashMachine>? washMachines,
  }) {
    return LaundryEmployeeWashMachinesTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      washMachines: washMachines ?? this.washMachines,
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
      washMachines,
    ];
  }
}
