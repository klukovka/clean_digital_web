part of 'admin_settings_tab_cubit.dart';

enum AdminSettingsTabStatus {
  loading,
  success,
  error,
  deleted,
}

class AdminSettingsTabState extends Equatable {
  final AdminSettingsTabStatus status;
  final String errorMessage;
  final User user;

  const AdminSettingsTabState({
    this.status = AdminSettingsTabStatus.loading,
    this.errorMessage = '',
    this.user = const User.empty(),
  });

  AdminSettingsTabState copyWith({
    AdminSettingsTabStatus? status,
    String? errorMessage,
    User? user,
  }) {
    return AdminSettingsTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, user];
}
