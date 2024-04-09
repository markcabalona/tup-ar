import 'package:tup_ar/core/dependencies/authentication.dart';
import 'package:tup_ar/core/dependencies/event_places.dart';
import 'package:tup_ar/core/dependencies/faqs.dart';
import 'package:tup_ar/core/dependencies/theme_ratings.dart';

Future<void> initializeDependencies() async {
  initialzieAuthDependencies();
  initializeFaqsDependencies();
  initializeThemeRatingsDependencies();
  initializeEventPlacesDependencies();
}
