import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/ThemeRating/data/datasources/theme_ratings_remote_datasource.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';
import 'package:tup_ar/features/ThemeRating/domain/repositories/theme_ratings_repository.dart';

class ThemeRatingsRepositoryImpl implements ThemeRatingsRepository {
  final ThemeRatingsRemoteDatasource _themeRatingsRemoteDatasource;

  const ThemeRatingsRepositoryImpl({
    required ThemeRatingsRemoteDatasource themeRatingsRemoteDatasource,
  }) : _themeRatingsRemoteDatasource = themeRatingsRemoteDatasource;

  @override
  Future<Either<ThemeRatingsFailure, List<ThemeRating>>> fetchRatings({
    required String eventPlaceId,
  }) async {
    try {
      return Right(await _themeRatingsRemoteDatasource.fetchThemeRatings(
        eventPlaceId: eventPlaceId,
      ));
    } on ThemeRatingsException catch (e) {
      return Left(
        ThemeRatingsFailure(
          errorMessage: e.message,
        ),
      );
    }
  }
}
