import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/features/Authentication/domain/entities/user_data.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/authenticated/profile_icon.dart';
import 'package:tup_ar_core/constants/spacer_constants.dart';

class DashboardDrawerHeader extends StatelessWidget {
  const DashboardDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final UserData? user = state.userData;
        if (user == null) {
          //TODO: Return default widget here
          return const Placeholder();
        }

        return DrawerHeader(
          child: Row(
            children: [
              const ProfileIcon(),
              SpacerConstants.horizontalSmall,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hi, ${user.firstName} ${user.lastName}!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Tooltip(
                      message: user.email,
                      child: AutoSizeText(
                        user.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
