import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/features/Authentication/presentation/pages/registration_page.dart';

abstract class AuthenticationRoutes {
  static final routes = [
    _login,
    _registration,
  ];

  static final _registration = GoRoute(
    name: AppRoutes.registration.name,
    path: AppRoutes.registration.path,
    pageBuilder: (context, state) => const MaterialPage(
      child: RegistrationPage(),
    ),
  );

  static final _login = GoRoute(
    name: AppRoutes.login.name,
    path: AppRoutes.login.path,
    pageBuilder: (context, state) => const MaterialPage(
      child: Placeholder(),
    ),
  );
}
