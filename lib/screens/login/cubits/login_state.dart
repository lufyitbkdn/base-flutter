part of 'login_cubits.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.emailError = '',
    this.password = '',
    this.passwordError = '',
    this.isButtonEnabled = false,
  });

  final String email;
  final String emailError;
  final String password;
  final String passwordError;
  final bool isButtonEnabled;

  @override
  List<Object?> get props => [emailError, passwordError, isButtonEnabled];

  LoginState copyWith({
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
    bool? isButtonEnabled,
  }) =>
      LoginState(
        email: email ?? this.email,
        emailError: emailError ?? this.emailError,
        password: password ?? this.password,
        passwordError: passwordError ?? this.passwordError,
        isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      );
}
