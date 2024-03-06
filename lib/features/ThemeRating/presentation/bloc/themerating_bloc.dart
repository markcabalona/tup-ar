import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'themerating_event.dart';
part 'themerating_state.dart';

class ThemeratingBloc extends Bloc<ThemeratingEvent, ThemeratingState> {
  ThemeratingBloc() : super(ThemeratingInitial()) {
    on<ThemeratingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
