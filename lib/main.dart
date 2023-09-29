import 'package:flutter/material.dart';
import 'package:tup_ar/core/theme/app_theme.dart';
import 'package:tup_ar/features/Authentication/presentation/pages/registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUP AR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
        inputDecorationTheme: AppTheme.inputDecorationTheme,
        filledButtonTheme: AppTheme.filledButtonTheme,
      ),
      home: const RegistrationPage(),
    );
  }
}
