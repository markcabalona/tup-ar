part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  unauthenticated,
  authenticating,
  registered,
  loggedIn,
}

class AuthenticationState extends Equatable {
  final RegistrationFormState registrationFormState;
  final LoginFormState loginFormState;
  final UserData? userData;
  final AuthenticationStatus status;
  final String? errorMessage;
  final String? successMessage;
  final String? loadingMessage;
  const AuthenticationState({
    this.registrationFormState = const RegistrationFormState(),
    this.loginFormState = const LoginFormState(),
    this.userData,
    this.status = AuthenticationStatus.unauthenticated,
    this.errorMessage,
    this.successMessage,
    this.loadingMessage,
  });

  @override
  List<Object?> get props => [
        registrationFormState,
        loginFormState,
        userData,
        status,
        errorMessage,
        successMessage,
        loadingMessage,
      ];

  AuthenticationState copyWith({
    ValueGetter<RegistrationFormState>? registrationFormState,
    ValueGetter<LoginFormState>? loginFormState,
    ValueGetter<UserData?>? userData,
    ValueGetter<AuthenticationStatus>? status,
    ValueGetter<String?>? errorMessage,
    ValueGetter<String?>? successMessage,
    ValueGetter<String?>? loadingMessage,
  }) {
    return AuthenticationState(
      registrationFormState: registrationFormState != null
          ? registrationFormState()
          : this.registrationFormState,
      loginFormState:
          loginFormState != null ? loginFormState() : this.loginFormState,
      userData: userData != null ? userData() : this.userData,
      status: status != null ? status() : this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      successMessage:
          successMessage != null ? successMessage() : this.successMessage,
      loadingMessage:
          loadingMessage != null ? loadingMessage() : this.loadingMessage,
    );
  }
}

class RegistrationFormState extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  const RegistrationFormState({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      email,
      password,
    ];
  }

  RegistrationFormState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return RegistrationFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class LoginFormState extends Equatable {
  final String? email;
  final String? password;
  const LoginFormState({
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [email, password];

  LoginFormState copyWith({
    String? email,
    String? password,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
