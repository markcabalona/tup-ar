import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tup_ar/core/dependencies/dependencies.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/firebase_options.dart';
import 'package:tup_ar_core/themes/tup_ar_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.tupArProject,
  );
  await Firebase.initializeApp(
    name: 'tup-ar-web',
    options: DefaultFirebaseOptions.tupArWebProject,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'vAR: Venue\'s Augmented Reality',
      theme: TupArTheme.themeData,
      routeInformationParser: AppRouter.routeInformationParser,
      routeInformationProvider: AppRouter.routeInformationProvider,
      routerDelegate: AppRouter.routerDelegate,
    );
  }
}
