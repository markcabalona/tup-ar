import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/authenticated/dashboard_drawer_header.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DashboardDrawerHeader(),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              GetIt.instance<AuthenticationBloc>().add(
                LogoutEvent(),
              );
            },
            trailing: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
