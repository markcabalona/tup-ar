part of 'event_place_bloc.dart';

sealed class EventPlaceState extends Equatable {
  const EventPlaceState();
  
  @override
  List<Object> get props => [];
}

final class EventPlaceInitial extends EventPlaceState {}
