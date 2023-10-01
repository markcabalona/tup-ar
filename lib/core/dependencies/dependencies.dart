import 'package:tup_ar/core/dependencies/authentication.dart';
import 'package:tup_ar/core/dependencies/background_tasks.dart';

Future<void> initializeDependencies() async {
  initializeBackgroundTasksDependencies();
  initialzieAuthDependencies();
}
