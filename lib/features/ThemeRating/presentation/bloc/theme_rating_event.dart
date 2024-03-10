part of 'theme_rating_bloc.dart';

sealed class ThemeRatingEvent extends Equatable {
  const ThemeRatingEvent();

  @override
  List<Object> get props => [];
}

final class FetchThemeRatingsEvent extends ThemeRatingEvent {
  final EventPlace eventPlace;
  const FetchThemeRatingsEvent({
    required this.eventPlace,
  });

  @override
  List<Object> get props => [eventPlace];
}
