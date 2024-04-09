part of 'event_places_bloc.dart';

sealed class EventPlacesState extends Equatable {
  const EventPlacesState();

  @override
  List<Object?> get props => [];
}

final class EventPlacesInitial extends EventPlacesState {}

class FetchEventsPlacesState extends EventPlacesState {
  final StateStatus status;
  final String? statusMessage;
  final List<EventPlace>? eventPlaces;

  const FetchEventsPlacesState({
    required this.status,
    this.statusMessage,
    this.eventPlaces,
  });

  @override
  List<Object?> get props => [
        status,
        eventPlaces,
        statusMessage,
      ];

  FetchEventsPlacesState copyWith({
    StateStatus? status,
    ValueGetter<String?>? statusMessage,
    ValueGetter<List<EventPlace>?>? eventPlaces,
  }) {
    return FetchEventsPlacesState(
      status: status ?? this.status,
      statusMessage:
          statusMessage != null ? statusMessage() : this.statusMessage,
      eventPlaces: eventPlaces != null ? eventPlaces() : this.eventPlaces,
    );
  }
}
