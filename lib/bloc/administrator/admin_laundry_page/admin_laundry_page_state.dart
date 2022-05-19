part of 'admin_laundry_page_cubit.dart';

enum AdminLaundryPageStatus {
  error,
  loading,
  success,
}

class AdminLaundryPageState extends Equatable {
  final AdminLaundryPageStatus status;
  final String errorMessage;
  final Laundry laundry;

  const AdminLaundryPageState({
    this.status = AdminLaundryPageStatus.loading,
    this.errorMessage = '',
    this.laundry = const Laundry.empty(),
  });

  AdminLaundryPageState copyWith({
    AdminLaundryPageStatus? status,
    String? errorMessage,
    Laundry? laundry,
  }) {
    return AdminLaundryPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      laundry: laundry ?? this.laundry,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, laundry];
}
