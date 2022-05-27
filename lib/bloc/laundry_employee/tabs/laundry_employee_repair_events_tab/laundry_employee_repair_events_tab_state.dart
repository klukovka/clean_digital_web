part of 'laundry_employee_repair_events_tab_cubit.dart';

enum RepairEventsTabStatus {
  loading,
  error,
  success,
}

class RepairEventsTabState extends Equatable {
  final RepairEventsTabStatus status;
  final String errorMessage;
  final int totalElements;
  final List<RepairEvent> repairEvents;

  const RepairEventsTabState({
    this.status = RepairEventsTabStatus.loading,
    this.errorMessage = '',
    this.totalElements = 0,
    this.repairEvents = const [],
  });

  RepairEventsTabState copyWith({
    RepairEventsTabStatus? status,
    String? errorMessage,
    int? totalElements,
    List<RepairEvent>? repairEvents,
  }) {
    return RepairEventsTabState(
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
