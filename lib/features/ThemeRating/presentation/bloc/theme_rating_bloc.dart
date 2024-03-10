import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/features/Authentication/domain/repositories/login_repository.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';
import 'package:tup_ar/features/ThemeRating/domain/repositories/theme_ratings_repository.dart';

part 'theme_rating_event.dart';
part 'theme_rating_state.dart';

class ThemeRatingBloc extends Bloc<ThemeRatingEvent, ThemeRatingState> {
  final ThemeRatingsRepository _themeRatingsRepository;
  final LoginRepository _loginRepository;
  ThemeRatingBloc({
    required ThemeRatingsRepository themeRatingsRepository,
    required LoginRepository loginRepository,
  })  : _themeRatingsRepository = themeRatingsRepository,
        _loginRepository = loginRepository,
        super(const ThemeRatingInitial()) {
    on<FetchThemeRatingsEvent>(_onFetchThemeRatingsEvent);
    on<AddThemeRatingEvent>(_onAddThemeRatingEvent);
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
            themeRatings: ratings
              ..sort(
                (a, b) {
                  return b.createdAt.difference(a.createdAt).inMilliseconds;
                },
              ),
          ),
        );
      },
    );
  }

  FutureOr<void> _onAddThemeRatingEvent(
    AddThemeRatingEvent event,
    Emitter<ThemeRatingState> emit,
  ) async {
    final userResult = await _loginRepository.checkUserLogin();

    userResult.fold(
      (l) => null,
      (r) async {
        if (r != null) {
          final result = await _themeRatingsRepository.addRating(
            rating: event.rating,
            eventPlaceId: event.eventPlace.id,
            userId: r.userId,
            comment: event.comment,
            userProfileImage: r.profileImage,
            username: r.firstName,
          );
          result.fold(
            (l) {},
            (r) {
              add(
                FetchThemeRatingsEvent(
                  eventPlace: event.eventPlace,
                ),
              );
            },
          );
        }
      },
    );
  }
}
