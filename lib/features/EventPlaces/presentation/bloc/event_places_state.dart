part of 'event_places_bloc.dart';

sealed class EventPlacesState extends Equatable {
  const EventPlacesState();
  
  @override
  List<Object> get props => [];
}

final class EventPlacesInitial extends EventPlacesState {}
