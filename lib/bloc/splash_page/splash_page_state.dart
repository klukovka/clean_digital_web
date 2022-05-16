part of 'splash_page_cubit.dart';

enum SplashPageStatus {
  loading,
  error,
  unauthorized,
  authorized,
}

@immutable
class SplashPageState extends Equatable {
  final SplashPageStatus status;
  final String errorMessage;
  final Role? role;

  const SplashPageState({
    this.status = SplashPageStatus.loading,
    this.errorMessage = '',
    this.role,
  });

  SplashPageState copyWith({
    SplashPageStatus? status,
    String? errorMessage,
    Role? role,
  }) {
    return SplashPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, role];
}
