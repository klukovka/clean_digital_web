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
  final List<RatingStatisticLaundry> rating;
  final List<PaymentStatisticLaundry> payment;
  final List<TimeAndUsageStatisticLaundry> timeAndUsage;
  final List<RepairStatisticLaundry> repair;

  const AdminStatisticTabState({
    this.status = AdminStatisticTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.rating = const [],
    this.payment = const [],
    this.timeAndUsage = const [],
    this.repair = const [],
  });

  AdminStatisticTabState copyWith({
    AdminStatisticTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<RatingStatisticLaundry>? rating,
    List<PaymentStatisticLaundry>? payment,
    List<TimeAndUsageStatisticLaundry>? timeAndUsage,
    List<RepairStatisticLaundry>? repair,
  }) {
    return AdminStatisticTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      rating: rating ?? this.rating,
      payment: payment ?? this.payment,
      timeAndUsage: timeAndUsage ?? this.timeAndUsage,
      repair: repair ?? this.repair,
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
      rating,
      payment,
      timeAndUsage,
      repair,
    ];
  }
}
