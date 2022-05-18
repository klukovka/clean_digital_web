part of 'admin_backups_tab_cubit.dart';

enum AdminBackupsTabStatus {
  error,
  loading,
  loadingButton,
  success,
  created,
  restored,
}

class AdminBackupsTabState extends Equatable {
  final AdminBackupsTabStatus status;
  final String errorMessage;
  final List<String> backups;

  const AdminBackupsTabState({
    this.status = AdminBackupsTabStatus.loading,
    this.errorMessage = '',
    this.backups = const [],
  });

  AdminBackupsTabState copyWith({
    AdminBackupsTabStatus? status,
    String? errorMessage,
    List<String>? backups,
  }) {
    return AdminBackupsTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      backups: backups ?? this.backups,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, backups];
}
