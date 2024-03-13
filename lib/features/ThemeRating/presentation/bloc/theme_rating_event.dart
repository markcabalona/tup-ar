part of 'theme_rating_bloc.dart';

sealed class ThemeRatingEvent extends Equatable {
  const ThemeRatingEvent();

  @override
  List<Object?> get props => [];
}

final class FetchThemeRatingsEvent extends ThemeRatingEvent {
  final EventPlace eventPlace;
  const FetchThemeRatingsEvent({
    required this.eventPlace,
  });

  @override
  List<Object?> get props => [eventPlace];
}

final class AddThemeRatingEvent extends ThemeRatingEvent {
  final EventPlace eventPlace;
  final int rating;
  final String? comment;
  final bool isAnonymous;

  const AddThemeRatingEvent({
    required this.eventPlace,
    required this.rating,
    this.isAnonymous = false,
    this.comment,
  });

  @override
  List<Object?> get props => [
        eventPlace,
        rating,
        comment,
        isAnonymous,
      ];
}

final class UpdateAddThemeRatingFormEvent extends ThemeRatingEvent {
  final bool? isAnonymous;
  final String? comment;
  final int? rating;

  const UpdateAddThemeRatingFormEvent({
    this.isAnonymous,
    this.comment,
    this.rating,
  });

  @override
  List<Object?> get props => [
        isAnonymous,
        comment,
        rating,
      ];
}
