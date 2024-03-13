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
    ThemeRatingState initialState = const ThemeRatingInitial(),
  })  : _themeRatingsRepository = themeRatingsRepository,
        _loginRepository = loginRepository,
        super(initialState) {
    on<FetchThemeRatingsEvent>(_onFetchThemeRatingsEvent);
    on<AddThemeRatingEvent>(_onAddThemeRatingEvent);
    on<UpdateAddThemeRatingFormEvent>(_onUpdateThemeRatingFormEvent);
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

    final user = userResult.fold(
      (l) => null,
      (r) => r,
    );
    if (user != null) {
      final result = await _themeRatingsRepository.addRating(
        rating: event.rating,
        eventPlaceId: event.eventPlace.id,
        userId: user.userId,
        comment: event.comment,
        userProfileImage: event.isAnonymous ? null : user.profileImage,
        username: event.isAnonymous ? null : user.firstName,
      );
      result.fold(
        (l) {},
        (r) {
          emit(AddThemeRatingSuccessState());
        },
      );
    }
  }

  FutureOr<void> _onUpdateThemeRatingFormEvent(
    UpdateAddThemeRatingFormEvent event,
    Emitter<ThemeRatingState> emit,
  ) {
    if (state is! AddThemeRatingState) {
      emit(
        const AddThemeRatingState().copyWith(
          comment: event.comment,
          isAnonymous: event.isAnonymous,
          rating: event.rating,
        ),
      );
    } else {
      emit((state as AddThemeRatingState).copyWith(
        comment: event.comment,
        isAnonymous: event.isAnonymous,
        rating: event.rating,
      ));
    }
  }
}
