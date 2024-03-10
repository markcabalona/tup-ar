import 'package:tup_ar/core/dependencies/authentication.dart';
import 'package:tup_ar/core/dependencies/background_tasks.dart';
import 'package:tup_ar/core/dependencies/faqs.dart';
import 'package:tup_ar/core/dependencies/theme_ratings.dart';

Future<void> initializeDependencies() async {
  initializeBackgroundTasksDependencies();
  initialzieAuthDependencies();
  initializeFaqsDependencies();
  initializeThemeRatingsDependencies();
}
