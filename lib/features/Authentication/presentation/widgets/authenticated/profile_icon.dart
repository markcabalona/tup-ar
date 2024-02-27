import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 32,
      child: ClipOval(
        clipBehavior: Clip.hardEdge,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            final imageUrl = state.userData?.profileImage;

            if (imageUrl != null) {
              return Image.network(imageUrl);
            }
            return const Icon(
              Icons.person,
              size: 40,
            );
          },
        ),
      ),
    );
  }
}
