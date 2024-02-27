import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar/features/Authentication/domain/entities/user_credentials.dart';
import 'package:tup_ar/features/Authentication/domain/entities/user_data.dart';
import 'package:tup_ar/features/Authentication/domain/repositories/login_repository.dart';
import 'package:tup_ar/features/Authentication/domain/repositories/registration_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegistrationRepository _registrationRepository;
  final LoginRepository _loginRepository;
  AuthenticationBloc({
    required RegistrationRepository registrationRepository,
    required LoginRepository loginRepository,
  })  : _registrationRepository = registrationRepository,
        _loginRepository = loginRepository,
        super(const AuthenticationState()) {
    on<CheckUserLoginEvent>(_onCheckUserLogin);
    on<UpdateRegistrationFormEvent>(_onUpdateRegistrationFormEvent);
    on<RegisterWithEmailEvent>(_onRegisterWithEmailEvent);
    on<UpdateLoginFormEvent>(_onUpdateLoginFormEvent);
    on<LoginWithEmailAndPasswordEvent>(_onLoginWithEmailAndPasswordEvent);
    on<LoginWithGoogleEvent>(_onLoginWithGoogleEvent);
    on<RegisterWithGoogleEvent>(_onRegisterWithGoogleEvent);
    on<SignInWithCredentialsEvent>(_onSignInWithCredentialsEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }

  Future<void> _onCheckUserLogin(
    CheckUserLoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final result = await _loginRepository.checkUserLogin();

    result.fold(
      (_) => null,
      (user) {
        emit(state.copyWith(
          status: () => AuthenticationStatus.loggedIn,
          userData: () => user,
        ));
      },
    );
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
    _emitLoading(
      emit,
      loadingMessage: AuthConstants.registrationAttemptMessage,
    );

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
            status: () => AuthenticationStatus.unauthenticated,
          ),
        );
      },
      (userData) {
        emit(state.copyWith(
          userData: () => userData,
          status: () => AuthenticationStatus.registered,
          successMessage: () => AuthConstants.registrationSuccessMessage,
        ));
      },
    );
  }

  FutureOr<void> _onUpdateLoginFormEvent(
    UpdateLoginFormEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(
      state.copyWith(
        loginFormState: () => state.loginFormState.copyWith(
          email: event.email,
          password: event.password,
        ),
      ),
    );
  }

  FutureOr<void> _onLoginWithEmailAndPasswordEvent(
    LoginWithEmailAndPasswordEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    _emitLoading(
      emit,
      loadingMessage: AuthConstants.loginAttemptMessage,
    );

    final result = await _loginRepository.loginWithEmailAndPassword(
      email: state.loginFormState.email!,
      password: state.loginFormState.password!,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: () => failure.errorMessage,
            status: () => AuthenticationStatus.unauthenticated,
          ),
        );
      },
      (userData) {
        emit(state.copyWith(
          userData: () => userData,
          status: () => AuthenticationStatus.loggedIn,
          successMessage: () => AuthConstants.loginSuccessMessage,
        ));
      },
    );
  }

  FutureOr<void> _onLoginWithGoogleEvent(
    LoginWithGoogleEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    _emitLoading(
      emit,
      loadingMessage: AuthConstants.loginAttemptMessage,
    );
    final result = await _loginRepository.loginWithGoogle();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: () => failure.errorMessage,
            status: () => AuthenticationStatus.unauthenticated,
          ),
        );
      },
      (userData) {
        emit(state.copyWith(
          userData: () => userData,
          status: () => AuthenticationStatus.loggedIn,
          successMessage: () => AuthConstants.loginSuccessMessage,
        ));
      },
    );
  }

  FutureOr<void> _onRegisterWithGoogleEvent(
    RegisterWithGoogleEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    _emitLoading(
      emit,
    );
    final result = await _registrationRepository.registerWithGoogle();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: () => failure.errorMessage,
            status: () => AuthenticationStatus.unauthenticated,
          ),
        );
      },
      (userCredentials) {
        emit(state.copyWith(
          userCredentials: () => userCredentials,
          status: () => AuthenticationStatus.onGoogleRegistrationProcess,
        ));
      },
    );
  }

  FutureOr<void> _onSignInWithCredentialsEvent(
    SignInWithCredentialsEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    _emitLoading(
      emit,
      loadingMessage: AuthConstants.registrationAttemptMessage,
    );

    final result = await _registrationRepository.signInWithCredentials(
      accessToken: state.userCredentials!.accessToken,
      firstName: state.registrationFormState.firstName!,
      lastName: state.registrationFormState.lastName!,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: () => failure.errorMessage,
            status: () => AuthenticationStatus.unauthenticated,
          ),
        );
      },
      (userData) {
        emit(state.copyWith(
          userData: () => userData,
          status: () => AuthenticationStatus.registered,
          successMessage: () => AuthConstants.registrationSuccessMessage,
        ));
      },
    );
  }

  FutureOr<void> _onLogoutEvent(
    LogoutEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    _emitLoading(
      emit,
      loadingMessage: AuthConstants.logoutAttemptMessage,
    );

    final result = await _loginRepository.logout();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: () => failure.errorMessage,
            status: () => AuthenticationStatus.unauthenticated,
          ),
        );
      },
      (userData) {
        emit(state.copyWith(
          userData: () => null,
          status: () => AuthenticationStatus.unauthenticated,
          successMessage: () => AuthConstants.logoutSuccessMessage,
        ));
      },
    );
  }

  void _emitLoading(
    Emitter<AuthenticationState> emit, {
    String? loadingMessage,
  }) {
    emit(state.copyWith(
      errorMessage: () => null,
      userData: () => null,
      successMessage: () => null,
      status: () => AuthenticationStatus.authenticating,
      loadingMessage: () => loadingMessage,
    ));
  }
}
