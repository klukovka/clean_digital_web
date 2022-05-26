part of 'laundry_employee_events_tab_cubit.dart';

enum LaundryEmployeeEventsTabStatus {
  loading,
  error,
  success,
}

class LaundryEmployeeEventsTabState extends Equatable {
  final LaundryEmployeeEventsTabStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<Event> events;

  const LaundryEmployeeEventsTabState({
    this.status = LaundryEmployeeEventsTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.events = const [],
  });

  LaundryEmployeeEventsTabState copyWith({
    LaundryEmployeeEventsTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<Event>? events,
  }) {
    return LaundryEmployeeEventsTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      events: events ?? this.events,
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
      events,
    ];
  }
}
