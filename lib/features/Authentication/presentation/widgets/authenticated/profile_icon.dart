import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/widgets/user_profile_image.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return UserProfileImage(
          imageUrl: state.userData?.profileImage,
        );
      },
    );
  }
}
