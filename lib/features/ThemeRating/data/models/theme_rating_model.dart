import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';

class ThemeRatingModel extends ThemeRating {
  const ThemeRatingModel({
    required super.id,
    required super.rating,
    required super.eventPlaceId,
    required super.userId,
    required super.createdAt,
    super.username,
    super.userProfileImage,
    super.comment,
  });

  Map<String, dynamic> toMap({
    String? id,
  }) {
    return {
      if (id != null) 'id': id,
      'rating': rating,
      'eventPlaceId': eventPlaceId,
      'userId': userId,
      'username': username,
      'userProfileImage': userProfileImage,
      'comment': comment,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory ThemeRatingModel.fromMap(Map<String, dynamic> map) {
    final Timestamp createdAtTimeStamp = map['createdAt'];
    return ThemeRatingModel(
      id: map['id'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
      eventPlaceId: map['eventPlaceId'] ?? '',
      userId: map['userId'] ?? '',
      username: map['username'],
      userProfileImage: map['userProfileImage'],
      comment: map['comment'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        createdAtTimeStamp.millisecondsSinceEpoch,
      ),
    );
  }
}
