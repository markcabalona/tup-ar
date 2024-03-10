import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';

part 'theme_rating_event.dart';
part 'theme_rating_state.dart';

class ThemeRatingBloc extends Bloc<ThemeRatingEvent, ThemeRatingState> {
  ThemeRatingBloc() : super(const ThemeRatingInitial()) {
    on<FetchThemeRatingsEvent>(_onFetchThemeRatingsEvent);
  }

  FutureOr<void> _onFetchThemeRatingsEvent(
    FetchThemeRatingsEvent event,
    Emitter<ThemeRatingState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(
      ThemeRatingsLoaded(
        eventPlace: event.eventPlace,
        themeRatings: List.generate(
          20,
          (index) => ThemeRating(
            id: index.toString(),
            createdAt:
                DateTime.now().add(Duration(seconds: Random().nextInt(86400))),
            rating: Random().nextInt(5) + 1,
            eventPlaceId: event.eventPlace.id,
            userId: 'User-$index',
            comment: Random().nextBool()
                ? 'Pariatur consectetur ad et velit eu et nostrud sunt nulla nostrud. Ullamco esse adipisicing ex mollit deserunt aute reprehenderit ut.'
                : null,
          ),
        ),
      ),
    );
  }
}
