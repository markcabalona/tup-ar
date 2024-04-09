import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/assets_constants.dart';
import 'package:tup_ar/core/constants/auth_constants.dart';
import 'package:tup_ar_core/constants/spacer_constants.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed, // _onTapLoginWithGoogle(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AssetsConstants.googleIcon,
            height: 24,
          ),
          SpacerConstants.horizontalSmall,
          const Text(
            AuthConstants.continueWithGoogle,
          ),
        ],
      ),
    );
  }
}
