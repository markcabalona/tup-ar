import 'package:get_it/get_it.dart';
import 'package:tup_ar/features/ThemeRating/data/repositories/theme_ratings_repository_impl.dart';
import 'package:tup_ar/features/ThemeRating/domain/repositories/theme_ratings_repository.dart';

void initializeThemeRatingsDependencies() {
  final serviceLocator = GetIt.instance;

  serviceLocator.registerLazySingleton<ThemeRatingsRepository>(
    () => ThemeRatingsRepositoryImpl(
      themeRatingsRemoteDatasource: throw UnimplementedError(),
    ),
  );
}
