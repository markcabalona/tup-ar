import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event_place_event.dart';
part 'event_place_state.dart';

class EventPlaceBloc extends Bloc<EventPlaceEvent, EventPlaceState> {
  EventPlaceBloc() : super(EventPlaceInitial()) {
    on<EventPlaceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
