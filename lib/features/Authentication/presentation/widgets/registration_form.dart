import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar/core/constants/grid_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: GridConstants.small,
        vertical: GridConstants.medium,
      ),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: AuthConstants.firstNameLabelText,
              hintText: AuthConstants.firstNameHintText,
            ),
            keyboardType: TextInputType.name,
          ),
          SpacerConstants.mediumVertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthConstants.lastNameLabelText,
              hintText: AuthConstants.lastNameHintText,
            ),
            keyboardType: TextInputType.name,
          ),
          SpacerConstants.mediumVertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthConstants.emailLabelText,
              hintText: AuthConstants.emailHintText,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SpacerConstants.mediumVertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthConstants.passwordLabelText,
              hintText: AuthConstants.passwordHintText,
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          SpacerConstants.mediumVertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthConstants.confirmPasswordLabelText,
              hintText: AuthConstants.confirmPasswordHintText,
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          SpacerConstants.mediumVertical,
          FilledButton(
            onPressed: _onTapRegister,
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
    );
  }

  void _onTapLogin() {}

  void _onTapRegister() {}
}
