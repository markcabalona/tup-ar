import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar/core/constants/padding_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/core/utils/form_validator.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/google_sign_in_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();
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
            onChanged: (value) {
              authBloc.add(UpdateLoginFormEvent(
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
            validator: (value) => FormValidator.nonEmptyValidator(
              value,
              errorMessage: AuthConstants.passwordLoginFieldError,
            ),
            onChanged: (value) {
              authBloc.add(UpdateLoginFormEvent(
                password: value,
              ));
            },
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
          SpacerConstants.mediumVertical,
          const Padding(
            padding: PaddingConstants.largeHorizontal,
            child: Divider(),
          ),
          SpacerConstants.mediumVertical,
          GoogleSignInButton(
            onPressed: () => _onTapLoginWithGoogle(context),
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
      context.read<AuthenticationBloc>().add(
            LoginWithEmailAndPasswordEvent(),
          );
    }
  }

  void _onTapLoginWithGoogle(BuildContext context) {
    context.read<AuthenticationBloc>().add(
          LoginWithGoogleEvent(),
        );
  }
}
