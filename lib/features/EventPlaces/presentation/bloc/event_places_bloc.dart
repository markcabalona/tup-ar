import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/utils/state_status_enum.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/EventPlaces/domain/repositories/events_place_repository.dart';

part 'event_places_event.dart';
part 'event_places_state.dart';

class EventPlacesBloc extends Bloc<EventPlacesEvent, EventPlacesState> {
  final EventsPlaceRepository eventsPlaceRepository;
  EventPlacesBloc({
    this.eventsPlaceRepository = const EventsPlaceRepository(),
  }) : super(EventPlacesInitial()) {
    on<FetchEventPlacesEvent>(_onFetchEventPlacesEvent);
  }

  @override
  void onChange(Change<EventPlacesState> change) {
    super.onChange(change);

    if (change.nextState is FetchEventsPlacesState) {
      _latestFetchEventsPlacesState =
          change.nextState as FetchEventsPlacesState;
    }
  }

  FetchEventsPlacesState _latestFetchEventsPlacesState =
      const FetchEventsPlacesState(
    status: StateStatus.initial,
  );

  FutureOr<void> _onFetchEventPlacesEvent(
    FetchEventPlacesEvent event,
    Emitter<EventPlacesState> emit,
  ) async {
    emit(
      _latestFetchEventsPlacesState.copyWith(
        status: StateStatus.loading,
        statusMessage: () => 'Loading Event Places...',
      ),
    );

    final result = await eventsPlaceRepository.fetchEventPlaces();

    result.fold(
      (l) {
        log(l.toString());
        emit(
          _latestFetchEventsPlacesState.copyWith(
            status: StateStatus.error,
            statusMessage: () => l.errorMessage,
          ),
        );
      },
      (r) {
        emit(
          _latestFetchEventsPlacesState.copyWith(
            status: StateStatus.success,
            eventPlaces: () => r,
            statusMessage: () => 'Event Places Loaded.',
          ),
        );
      },
    );
  }
}
