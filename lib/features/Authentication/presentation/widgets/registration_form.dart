import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
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
              labelText: AuthConstants.firstNameLabelText,
              hintText: AuthConstants.firstNameHintText,
            ),
            keyboardType: TextInputType.name,
          ),
          SpacerConstants.vertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthConstants.lastNameLabelText,
              hintText: AuthConstants.lastNameHintText,
            ),
            keyboardType: TextInputType.name,
          ),
          SpacerConstants.vertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthConstants.emailLabelText,
              hintText: AuthConstants.emailHintText,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SpacerConstants.vertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthConstants.passwordLabelText,
              hintText: AuthConstants.passwordHintText,
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          SpacerConstants.vertical,
          const TextField(
            decoration: InputDecoration(
              labelText: AuthConstants.confirmPasswordLabelText,
              hintText: AuthConstants.confirmPasswordHintText,
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          SpacerConstants.mediumVertical,
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _onTapRegister,
              child: const Text(
                AuthConstants.registerText,
              ),
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
