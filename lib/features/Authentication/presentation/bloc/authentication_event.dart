part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class CheckUserLoginEvent extends AuthenticationEvent {}

final class UpdateRegistrationFormEvent extends AuthenticationEvent {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  const UpdateRegistrationFormEvent({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });
}

class RegisterWithEmailEvent extends AuthenticationEvent {}

final class UpdateLoginFormEvent extends AuthenticationEvent {
  final String? email;
  final String? password;

  const UpdateLoginFormEvent({
    this.email,
    this.password,
  });
}

class LoginWithEmailAndPasswordEvent extends AuthenticationEvent {}

class LoginWithGoogleEvent extends AuthenticationEvent {}

class RegisterWithGoogleEvent extends AuthenticationEvent {}

class SignInWithCredentialsEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}
