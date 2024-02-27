import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
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
            title: const Text('FAQs'),
            trailing: const Icon(
              Icons.question_mark_rounded,
            ),
            style: ListTileStyle.drawer,
            onTap: () {
              AppRouter.push(AppRoutes.faqs);
            },
          ),
          ListTile(
            title: const Text('Logout'),
            trailing: const Icon(
              Icons.logout,
            ),
            style: ListTileStyle.drawer,
            onTap: () {
              GetIt.instance<AuthenticationBloc>().add(
                LogoutEvent(),
              );
            },
          ),
        ],
      ),
    );
  }
}
