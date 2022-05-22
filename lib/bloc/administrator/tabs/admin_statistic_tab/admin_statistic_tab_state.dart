part of 'admin_statistic_tab_cubit.dart';

enum AdminStatisticTabStatus {
  success,
  loading,
  error,
}

class AdminStatisticTabState extends Equatable {
  final AdminStatisticTabStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<AllLaundryStatistic> statistic;

  const AdminStatisticTabState({
    this.status = AdminStatisticTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.statistic = const [],
  });

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      page,
      totalPages,
      totalElements,
      statistic,
    ];
  }

  AdminStatisticTabState copyWith({
    AdminStatisticTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<AllLaundryStatistic>? statistic,
  }) {
    return AdminStatisticTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      statistic: statistic ?? this.statistic,
    );
  }
}
