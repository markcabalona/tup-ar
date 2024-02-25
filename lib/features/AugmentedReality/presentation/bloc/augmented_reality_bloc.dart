import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'augmented_reality_event.dart';
part 'augmented_reality_state.dart';

class AugmentedRealityBloc extends Bloc<AugmentedRealityEvent, AugmentedRealityState> {
  AugmentedRealityBloc() : super(AugmentedRealityInitial()) {
    on<AugmentedRealityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
