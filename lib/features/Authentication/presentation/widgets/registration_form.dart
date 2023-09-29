import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/authentication_constants.dart';
import 'package:tup_ar/core/constants/padding_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: PaddingConstants.horizontal,
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: AuthenticationConstants.firstNameLabelText,
              hintText: AuthenticationConstants.firstNameHintText,
            ),
            keyboardType: TextInputType.name,
          ),
          SpacerConstants.vertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthenticationConstants.lastNameLabelText,
              hintText: AuthenticationConstants.lastNameHintText,
            ),
            keyboardType: TextInputType.name,
          ),
          SpacerConstants.vertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthenticationConstants.emailLabelText,
              hintText: AuthenticationConstants.emailHintText,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SpacerConstants.vertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthenticationConstants.passwordLabelText,
              hintText: AuthenticationConstants.passwordHintText,
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          SpacerConstants.vertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthenticationConstants.confirmPasswordLabelText,
              hintText: AuthenticationConstants.confirmPasswordHintText,
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          SpacerConstants.mediumVertical,
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _onTapRegister,
              child: const Text(
                AuthenticationConstants.registerText,
              ),
            ),
          ),
          SpacerConstants.mediumVertical,
          Text.rich(
            TextSpan( 
              children: [
                const TextSpan(
                  text: '${AuthenticationConstants.alreadyHaveAnAccount} ',
                ),
                TextSpan(
                  text: AuthenticationConstants.loginText,
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
