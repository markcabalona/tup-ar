import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/registration_form.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/user_credentials_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(),
      ),
      body: _buildRegistrationForm(),
    );
  }

  Widget _buildTitle() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final prefix =
            state.status == AuthenticationStatus.onGoogleRegistrationProcess
                ? 'Google '
                : '';
        return Text(
          prefix + AuthConstants.registrationHeaderText,
        );
      },
    );
  }

  Widget _buildRegistrationForm() =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status ==
              AuthenticationStatus.onGoogleRegistrationProcess) {
            return const UserCredentialsForm();
          }
          return const RegistrationForm();
        },
      );
}
