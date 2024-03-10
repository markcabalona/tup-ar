import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/features/ThemeRating/data/datasources/theme_ratings_remote_datasource.dart';
import 'package:tup_ar/features/ThemeRating/data/models/theme_rating_model.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';

class ThemeRatingsRemoteDatasourceImpl implements ThemeRatingsRemoteDatasource {
  final FirebaseFirestore _firestore;

  const ThemeRatingsRemoteDatasourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<List<ThemeRating>> fetchThemeRatings({
    required String eventPlaceId,
  }) async {
    try {
      final querySnapshot = await _firestore
          .collection('theme_ratings_collection')
          .where(
            'eventPlaceId',
            isEqualTo: eventPlaceId,
          )
          .get();
      return querySnapshot.docs.map((e) {
        return ThemeRatingModel.fromMap(e.data()
          ..addEntries(
            {'id': e.id}.entries,
          ));
      }).toList();
    } catch (e) {
      throw ThemeRatingsException(message: e.toString());
    }
  }

  @override
  Future<ThemeRating> addThemeRating({
    required ThemeRatingModel rating,
  }) async {
    try {
      final themeRatingsCollection =
          _firestore.collection('theme_ratings_collection');

      final themeRatingDocRef = await (await themeRatingsCollection.add(
        rating.toMap(),
      ))
          .get();

      return ThemeRatingModel.fromMap({
        ...rating.toMap(
          id: themeRatingDocRef.id,
        ),
      });
    } catch (e) {
      throw ThemeRatingsException(message: e.toString());
    }
  }
}
