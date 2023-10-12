import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/features/Authentication/domain/entities/user_data.dart';
import 'package:tup_ar/features/Authentication/domain/repositories/registration_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegistrationRepository _registrationRepository;
  AuthenticationBloc({
    required RegistrationRepository registrationRepository,
  })  : _registrationRepository = registrationRepository,
        super(const AuthenticationState()) {
    on<UpdateRegistrationFormEvent>(_onUpdateRegistrationFormEvent);
    on<RegisterWithEmailEvent>(_onRegisterWithEmailEvent);
    on<UpdateLoginFormEvent>(_onUpdateLoginFormEvent);
    on<LoginWithEmailAndPasswordEvent>(_onLoginWithEmailAndPasswordEvent);
  }

  FutureOr<void> _onUpdateRegistrationFormEvent(
    UpdateRegistrationFormEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(
      state.copyWith(
        registrationFormState: () => state.registrationFormState.copyWith(
          lastName: event.lastName,
          firstName: event.firstName,
          email: event.email,
          password: event.password,
        ),
      ),
    );
  }

  FutureOr<void> _onRegisterWithEmailEvent(
    RegisterWithEmailEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(
      errorMessage: () => null,
      userData: () => null,
      status: () => AuthenticationStatus.unauthenticated,
    ));
    final result = await _registrationRepository.registerWithEmail(
      email: state.registrationFormState.email!,
      password: state.registrationFormState.password!,
      firstName: state.registrationFormState.firstName!,
      lastName: state.registrationFormState.lastName!,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: () => failure.errorMessage,
          ),
        );
      },
      (userData) {
        emit(state.copyWith(
          userData: () => userData,
          status: () => AuthenticationStatus.registered,
        ));
      },
    );
  }

  FutureOr<void> _onUpdateLoginFormEvent(
    UpdateLoginFormEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    // TODO: Update login form implementation
  }

  FutureOr<void> _onLoginWithEmailAndPasswordEvent(
    LoginWithEmailAndPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    // TODO: Login with email and password implementation
  }
}
