part of 'laundry_employee_statistic_tab_cubit.dart';

enum LaundryEmployeeStatisticTabStatus {
  loading,
  error,
  success,
}

class LaundryEmployeeStatisticTabState extends Equatable {
  final LaundryEmployeeStatisticTabStatus status;
  final String errorMessage;
  final AllLaundryStatistic statistic;

  const LaundryEmployeeStatisticTabState({
    this.status = LaundryEmployeeStatisticTabStatus.loading,
    this.errorMessage = '',
    this.statistic = const AllLaundryStatistic.empty(),
  });

  LaundryEmployeeStatisticTabState copyWith({
    LaundryEmployeeStatisticTabStatus? status,
    String? errorMessage,
    AllLaundryStatistic? statistic,
  }) {
    return LaundryEmployeeStatisticTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      statistic: statistic ?? this.statistic,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, statistic];
}
