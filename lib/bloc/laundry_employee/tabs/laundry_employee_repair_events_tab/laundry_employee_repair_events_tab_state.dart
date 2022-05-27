part of 'laundry_employee_repair_events_tab_cubit.dart';

enum LaundryEmployeeRepairEventsTabStatus {
  loading,
  error,
  success,
}

class LaundryEmployeeRepairEventsTabState extends Equatable {
  final LaundryEmployeeRepairEventsTabStatus status;
  final String errorMessage;
  final int totalElements;
  final List<RepairEvent> repairEvents;

  const LaundryEmployeeRepairEventsTabState({
    this.status = LaundryEmployeeRepairEventsTabStatus.loading,
    this.errorMessage = '',
    this.totalElements = 0,
    this.repairEvents = const [],
  });

  LaundryEmployeeRepairEventsTabState copyWith({
    LaundryEmployeeRepairEventsTabStatus? status,
    String? errorMessage,
    int? totalElements,
    List<RepairEvent>? repairEvents,
  }) {
    return LaundryEmployeeRepairEventsTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      totalElements: totalElements ?? this.totalElements,
      repairEvents: repairEvents ?? this.repairEvents,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      totalElements,
      repairEvents,
    ];
  }
}
