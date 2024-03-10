import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';
import 'package:tup_ar/features/ThemeRating/domain/repositories/theme_ratings_repository.dart';

part 'theme_rating_event.dart';
part 'theme_rating_state.dart';

class ThemeRatingBloc extends Bloc<ThemeRatingEvent, ThemeRatingState> {
  final ThemeRatingsRepository _themeRatingsRepository;
  ThemeRatingBloc({
    required ThemeRatingsRepository themeRatingsRepository,
  })  : _themeRatingsRepository = themeRatingsRepository,
        super(const ThemeRatingInitial()) {
    on<FetchThemeRatingsEvent>(_onFetchThemeRatingsEvent);
  }

  FutureOr<void> _onFetchThemeRatingsEvent(
    FetchThemeRatingsEvent event,
    Emitter<ThemeRatingState> emit,
  ) async {
    emit(const ThemeRatingsLoading());
    final result = await _themeRatingsRepository.fetchRatings(
      eventPlaceId: event.eventPlace.id,
    );

    result.fold(
      (failure) {
        emit(
          ThemeRatingsError(
            eventPlace: event.eventPlace,
            message: failure.errorMessage,
          ),
        );
      },
      (ratings) {
        emit(
          ThemeRatingsLoaded(
            eventPlace: event.eventPlace,
            themeRatings: ratings,
          ),
        );
      },
    );
  }
}
