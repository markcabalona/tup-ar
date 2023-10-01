import 'package:flutter/material.dart';
import 'package:tup_ar/core/dependencies/dependencies.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/core/theme/app_theme.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TUP AR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
        inputDecorationTheme: AppTheme.inputDecorationTheme,
        filledButtonTheme: AppTheme.filledButtonTheme,
      ),
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
