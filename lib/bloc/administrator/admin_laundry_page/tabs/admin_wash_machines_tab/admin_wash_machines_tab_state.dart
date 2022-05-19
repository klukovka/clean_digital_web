part of 'admin_wash_machines_tab_cubit.dart';

enum AdminWashMachinesTabStatus {
  loading,
  error,
  success,
}

class AdminWashMachinesTabState extends Equatable {
  final AdminWashMachinesTabStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<WashMachine> washMachines;

  const AdminWashMachinesTabState({
    this.status = AdminWashMachinesTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.washMachines = const [],
  });

  AdminWashMachinesTabState copyWith({
    AdminWashMachinesTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<WashMachine>? washMachines,
  }) {
    return AdminWashMachinesTabState(
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
