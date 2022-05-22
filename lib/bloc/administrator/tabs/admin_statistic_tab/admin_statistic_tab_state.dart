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
  final AllLaundryStatistic? selectedLaundry;

  const AdminStatisticTabState({
    this.status = AdminStatisticTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.statistic = const [],
    this.selectedLaundry,
  });

  @override
  List<Object?> get props {
    return [
      status,
      errorMessage,
      page,
      totalPages,
      totalElements,
      statistic,
      selectedLaundry,
    ];
  }

  AdminStatisticTabState copyWith({
    AdminStatisticTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<AllLaundryStatistic>? statistic,
    AllLaundryStatistic? selectedLaundry,
  }) {
    return AdminStatisticTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      statistic: statistic ?? this.statistic,
      selectedLaundry: selectedLaundry ?? this.selectedLaundry,
    );
  }

  AdminStatisticTabState removeLaundry() {
    return AdminStatisticTabState(
      status: status,
      errorMessage: errorMessage,
      page: page,
      totalPages: totalPages,
      totalElements: totalElements,
      statistic: statistic,
      selectedLaundry: null,
    );
  }
}
