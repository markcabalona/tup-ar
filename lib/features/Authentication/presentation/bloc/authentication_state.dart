part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final RegistrationFormState registrationFormState;
  const AuthenticationState({
    this.registrationFormState = const RegistrationFormState(),
  });

  @override
  List<Object?> get props => [registrationFormState];

  AuthenticationState copyWith({
    ValueGetter<RegistrationFormState>? registrationFormState,
  }) {
    return AuthenticationState(
      registrationFormState: registrationFormState != null
          ? registrationFormState()
          : this.registrationFormState,
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
