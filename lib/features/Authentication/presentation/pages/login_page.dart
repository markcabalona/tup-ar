import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/grid_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: GridConstants.small,
          vertical: GridConstants.medium,
        ),
        child: Column(
          children: [
            SpacerConstants.largeVertical,
            FlutterLogo(
              size: 144,
            ),
            SpacerConstants.mediumVertical,
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
