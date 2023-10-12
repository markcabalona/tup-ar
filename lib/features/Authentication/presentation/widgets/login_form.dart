import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/core/utils/form_validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: AuthConstants.emailLabelText,
              hintText: AuthConstants.emailHintText,
            ),
            keyboardType: TextInputType.emailAddress,
            validator: FormValidator.emailValidator,
            onChanged: (value) {},
          ),
          SpacerConstants.mediumVertical,
          TextFormField(
            decoration: const InputDecoration(
              labelText: AuthConstants.passwordLabelText,
              hintText: AuthConstants.passwordHintText,
            ),
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => FormValidator.nonEmptyValidator(
              value,
              errorMessage: AuthConstants.passwordLoginFieldError,
            ),
            onChanged: (value) {},
          ),
          SpacerConstants.mediumVertical,
          FilledButton(
            onPressed: () {
              _onTapLogin(context, formKey);
            },
            child: const Text(
              AuthConstants.loginText,
            ),
          ),
          SpacerConstants.mediumVertical,
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: '${AuthConstants.noAccountYet} ',
                ),
                TextSpan(
                  text: AuthConstants.registerText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _onTapRegister,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapRegister() {
    AppRouter.push(AppRoutes.registration);
  }

  void _onTapLogin(
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) {
    if (formKey.currentState?.validate() ?? false) {
      // TODO: call login event here
    }
  }
}
