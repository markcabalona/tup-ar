import 'package:equatable/equatable.dart';

class ThemeRating extends Equatable {
  final String id;
  final int rating;
  final String eventPlaceId;

  final String userId;
  final String? username;
  final String? userProfileImage;
  final String? comment;
  final DateTime createdAt;

  const ThemeRating({
    required this.id,
    required this.rating,
    required this.eventPlaceId,
    required this.userId,
    this.username,
    this.userProfileImage,
    this.comment,
    required this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      rating,
      eventPlaceId,
      userId,
      username,
      userProfileImage,
      comment,
      createdAt,
    ];
  }
}
