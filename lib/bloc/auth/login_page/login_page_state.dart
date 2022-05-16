part of 'login_page_cubit.dart';

enum LoginPageStatus {
  initial,
  error,
  successAdmin,
  successLaundry,
  successRepairCompany,
  successEmployee,
  loading,
}

class LoginPageState extends Equatable {
  final LoginPageStatus status;
  final String errorMessage;
  final bool obscureText;

  const LoginPageState({
    this.status = LoginPageStatus.initial,
    this.errorMessage = '',
    this.obscureText = true,
  });

  @override
  List<Object> get props => [status, errorMessage, obscureText];

  LoginPageState copyWith({
    LoginPageStatus? status,
    String? errorMessage,
    bool? obscureText,
  }) {
    return LoginPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
