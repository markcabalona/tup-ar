import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event_places_event.dart';
part 'event_places_state.dart';

class EventPlacesBloc extends Bloc<EventPlacesEvent, EventPlacesState> {
  EventPlacesBloc() : super(EventPlacesInitial()) {
    on<EventPlacesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
