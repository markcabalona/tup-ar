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
        switch (state.status) {
          case AuthenticationStatus.registered || AuthenticationStatus.loggedIn:
            AppRouter.go(AppRoutes.home);
            GetIt.instance<BackgroundTasksCubit>().onSuccess(
              state.successMessage,
            );
            break;
          case AuthenticationStatus.unauthenticated:
            if (state.errorMessage != null) {
              GetIt.instance<BackgroundTasksCubit>().onErrorOccurred(
                state.errorMessage,
              );
            }
            break;
        }
      },
      child: child,
    );
  }
}
