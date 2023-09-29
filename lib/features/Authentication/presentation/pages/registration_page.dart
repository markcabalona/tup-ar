import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AuthConstants.registrationHeaderText,
        ),
      ),
      body: const RegistrationForm(),
    );
  }
}
