part of 'laundry_settings_tab_cubit.dart';

enum LaundrySettingsTabStatus {
  loading,
  success,
  error,
  deleted,
}

class LaundrySettingsTabState extends Equatable {
  final LaundrySettingsTabStatus status;
  final String errorMessage;
  final Laundry laundry;

  const LaundrySettingsTabState({
    this.laundry = const Laundry.empty(),
    this.status = LaundrySettingsTabStatus.loading,
    this.errorMessage = '',
  });

  LaundrySettingsTabState copyWith({
    LaundrySettingsTabStatus? status,
    String? errorMessage,
    Laundry? laundry,
  }) {
    return LaundrySettingsTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      laundry: laundry ?? this.laundry,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, laundry];
}
