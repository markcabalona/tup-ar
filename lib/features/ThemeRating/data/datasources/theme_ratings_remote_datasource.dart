import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';

abstract interface class ThemeRatingsRemoteDatasource {
  Future<List<ThemeRating>> fetchThemeRatings({
    required String eventPlaceId,
  });
}
