import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/core/cubits/background_tasks_cubit.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';

class AuthenticationStateListener extends StatelessWidget {
  const AuthenticationStateListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage ||
          previous.status != current.status,
      listener: (context, state) {
        final backgroundTaskCubit = GetIt.instance<BackgroundTasksCubit>();
        switch (state.status) {
          case AuthenticationStatus.authenticating:
            backgroundTaskCubit.onLoading(
              state.loadingMessage,
            );
            break;
          case AuthenticationStatus.registered || AuthenticationStatus.loggedIn:
            AppRouter.go(AppRoutes.eventsPlaces);
            backgroundTaskCubit.onSuccess(
              state.successMessage,
            );
            break;
          case AuthenticationStatus.onGoogleRegistrationProcess:
            backgroundTaskCubit.onIdle();
            AppRouter.go(AppRoutes.registration);
            break;

          case AuthenticationStatus.unauthenticated:
            if (state.errorMessage != null) {
              backgroundTaskCubit.onErrorOccurred(
                state.errorMessage,
              );
            } else {
              AppRouter.go(AppRoutes.login);
              backgroundTaskCubit.onSuccess(
                state.successMessage,
              );
            }
            break;
        }
      },
      child: child,
    );
  }
}
