import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar/core/constants/grid_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';
import 'package:tup_ar/core/utils/form_validator.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
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
            ),
            SpacerConstants.mediumVertical,
            TextFormField(
              decoration: const InputDecoration(
                labelText: AuthConstants.emailLabelText,
                hintText: AuthConstants.emailHintText,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: FormValidator.emailValidator,
            ),
            SpacerConstants.mediumVertical,
            TextFormField(
              decoration: const InputDecoration(
                labelText: AuthConstants.passwordLabelText,
                hintText: AuthConstants.passwordHintText,
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: FormValidator.passwordValidator,
            ),
            SpacerConstants.mediumVertical,
            TextFormField(
              decoration: const InputDecoration(
                labelText: AuthConstants.confirmPasswordLabelText,
                hintText: AuthConstants.confirmPasswordHintText,
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                // TODO: check if `value` == to password field's value
                return null;
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
}
