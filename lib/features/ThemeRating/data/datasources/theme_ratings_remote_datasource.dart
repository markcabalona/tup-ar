import 'package:tup_ar/features/ThemeRating/data/models/theme_rating_model.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';

abstract interface class ThemeRatingsRemoteDatasource {
  Future<List<ThemeRating>> fetchThemeRatings({
    required String eventPlaceId,
  });

  Future<ThemeRating> addThemeRating({
    required ThemeRatingModel rating,
  });
}
