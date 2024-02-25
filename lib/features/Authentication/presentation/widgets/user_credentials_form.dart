import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar/core/constants/grid_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';
import 'package:tup_ar/core/utils/form_validator.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';

class UserCredentialsForm extends StatelessWidget {
  const UserCredentialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();
    final formKey = GlobalKey<FormState>();

    final userCredentials = authBloc.state.userCredentials;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: GridConstants.small,
        vertical: GridConstants.medium,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: AuthConstants.emailLabelText,
              ),
              initialValue: userCredentials!.email,
              autofocus: true,
              enabled: false,
            ),
            SpacerConstants.mediumVertical,
            TextFormField(
              decoration: const InputDecoration(
                labelText: AuthConstants.firstNameLabelText,
                hintText: AuthConstants.firstNameHintText,
              ),
              keyboardType: TextInputType.name,
              validator: (value) {
                return FormValidator.nonEmptyValidator(
                  value,
                  errorMessage: AuthConstants.firstNameFieldError,
                );
              },
              onChanged: (value) {
                authBloc.add(UpdateRegistrationFormEvent(
                  firstName: value,
                ));
              },
            ),
            SpacerConstants.mediumVertical,
            TextFormField(
              decoration: const InputDecoration(
                labelText: AuthConstants.lastNameLabelText,
                hintText: AuthConstants.lastNameHintText,
              ),
              keyboardType: TextInputType.name,
              validator: (value) {
                return FormValidator.nonEmptyValidator(
                  value,
                  errorMessage: AuthConstants.lastNameFieldError,
                );
              },
              onChanged: (value) {
                authBloc.add(UpdateRegistrationFormEvent(
                  lastName: value,
                ));
              },
            ),
            SpacerConstants.mediumVertical,
            FilledButton(
              onPressed: () {
                _onTapRegister(context, formKey);
              },
              child: const Text(
                'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapRegister(
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) {
    if (formKey.currentState?.validate() ?? false) {
      context.read<AuthenticationBloc>().add(
            SignInWithCredentialsEvent(),
          );
    }
  }
}
