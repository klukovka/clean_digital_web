part of 'restore_password_page_cubit.dart';

enum RestorePasswordPageStatus {
  initial,
  error,
  success,
  loading,
}

class RestorePasswordPageState extends Equatable {
  final RestorePasswordPageStatus status;
  final String errorMessage;

  const RestorePasswordPageState({
    this.status = RestorePasswordPageStatus.initial,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [status, errorMessage];

  RestorePasswordPageState copyWith({
    RestorePasswordPageStatus? status,
    String? errorMessage,
  }) {
    return RestorePasswordPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
