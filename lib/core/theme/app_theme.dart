import 'package:flutter/material.dart';

abstract class AppTheme {
  static final inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        10,
      ),
    ),
  );
  static final filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      minimumSize: const Size.fromHeight(
        kTextTabBarHeight,
      ),
    ),
  );
}
