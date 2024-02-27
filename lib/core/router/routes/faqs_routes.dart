import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/features/Faqs/presentation/cubit/faqs_cubit.dart';
import 'package:tup_ar/features/Faqs/presentation/pages/faqs_page.dart';

abstract class FaqsRoutes {
  static final routes = [
    _faqs,
  ];

  static final _faqs = GoRoute(
    name: AppRoutes.faqs.name,
    path: AppRoutes.faqs.path,
    pageBuilder: (context, state) => MaterialPage(
      child: BlocProvider(
        create: (context) => GetIt.instance<FaqsCubit>(),
        child: const FaqsPage(),
      ),
    ),
  );
}
