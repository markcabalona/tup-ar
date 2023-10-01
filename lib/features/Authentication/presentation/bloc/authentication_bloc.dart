import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<UpdateRegistrationFormEvent>(_onUpdateRegistrationFormEvent);
    on<RegisterWithEmailEvent>(_onRegisterWithEmailEvent);
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
  ) {
    // TODO: implement registration with email
  }
}
