import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/features/ThemeRating/data/datasources/theme_ratings_remote_datasource.dart';
import 'package:tup_ar/features/ThemeRating/data/datasources/theme_ratings_remote_datasource_impl.dart';
import 'package:tup_ar/features/ThemeRating/data/repositories/theme_ratings_repository_impl.dart';
import 'package:tup_ar/features/ThemeRating/domain/repositories/theme_ratings_repository.dart';

void initializeThemeRatingsDependencies() {
  final serviceLocator = GetIt.instance;
  serviceLocator.registerLazySingleton<ThemeRatingsRemoteDatasource>(
    () => ThemeRatingsRemoteDatasourceImpl(
      firestore: FirebaseFirestore.instance,
    ),
  );

  serviceLocator.registerLazySingleton<ThemeRatingsRepository>(
    () => ThemeRatingsRepositoryImpl(
      themeRatingsRemoteDatasource: serviceLocator(),
    ),
  );
}
