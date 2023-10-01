
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar/core/constants/grid_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';
import 'package:tup_ar/core/utils/form_validator.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();
    final formKey = GlobalKey<FormState>();
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
            TextFormField(
              decoration: const InputDecoration(
                labelText: AuthConstants.emailLabelText,
                hintText: AuthConstants.emailHintText,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: FormValidator.emailValidator,
              onChanged: (value) {
                authBloc.add(UpdateRegistrationFormEvent(
                  email: value,
                ));
              },
            ),
            SpacerConstants.mediumVertical,
            TextFormField(
              decoration: const InputDecoration(
                labelText: AuthConstants.passwordLabelText,
                hintText: AuthConstants.passwordHintText,
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: FormValidator.passwordValidator,
              onChanged: (value) {
                authBloc.add(
                  UpdateRegistrationFormEvent(
                    password: value,
                  ),
                );
              },
            ),
            SpacerConstants.mediumVertical,
            TextFormField(
              decoration: const InputDecoration(
                labelText: AuthConstants.confirmPasswordLabelText,
                hintText: AuthConstants.confirmPasswordHintText,
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                final password = authBloc.state.registrationFormState.password;
                return _validateConfirmPassword(value, password);
              },
            ),
            SpacerConstants.mediumVertical,
            FilledButton(
              onPressed: () {
                _onTapRegister(formKey);
              },
              child: const Text(
                AuthConstants.registerText,
              ),
            ),
            SpacerConstants.mediumVertical,
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: '${AuthConstants.alreadyHaveAnAccount} ',
                  ),
                  TextSpan(
                    text: AuthConstants.loginText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _onTapLogin,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapLogin() {}

  void _onTapRegister(GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      // TODO: implement action when form has no errors
      // - start registration event
    }
  }

  String? _validateConfirmPassword(String? value, String? password) {
    if (password != value) {
      return AuthConstants.confirmPasswordFieldError;
    }
    return null;
  }
}
