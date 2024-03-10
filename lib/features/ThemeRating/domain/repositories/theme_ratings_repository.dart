import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';

abstract interface class ThemeRatingsRepository {
  Future<Either<ThemeRatingsFailure, List<ThemeRating>>> fetchRatings({
    required String eventPlaceId,
  });
}
