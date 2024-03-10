part of 'theme_rating_bloc.dart';

sealed class ThemeRatingState extends Equatable {
  const ThemeRatingState();

  EventPlace? get eventPlace => null;

  @override
  List<Object?> get props => [eventPlace];
}

final class ThemeRatingInitial extends ThemeRatingState {
  const ThemeRatingInitial();
}

final class ThemeRatingsLoading extends ThemeRatingState {
  const ThemeRatingsLoading();
}

final class ThemeRatingsLoaded extends ThemeRatingState {
  final List<ThemeRating> themeRatings;
  final EventPlace _eventPlace;

  const ThemeRatingsLoaded({
    required EventPlace eventPlace,
    required this.themeRatings,
  }) : _eventPlace = eventPlace;

  @override
  EventPlace get eventPlace => _eventPlace;

  @override
  List<Object?> get props => [themeRatings, eventPlace];
}

final class ThemeRatingsError extends ThemeRatingState {
  final String message;
  final EventPlace _eventPlace;

  const ThemeRatingsError({
    required EventPlace eventPlace,
    required this.message,
  }) : _eventPlace = eventPlace;

  @override
  EventPlace get eventPlace => _eventPlace;

  @override
  List<Object?> get props => [message, eventPlace];
}
