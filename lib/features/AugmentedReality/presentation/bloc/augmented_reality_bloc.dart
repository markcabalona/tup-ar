import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'augmented_reality_event.dart';
part 'augmented_reality_state.dart';

class AugmentedRealityBloc
    extends Bloc<AugmentedRealityEvent, AugmentedRealityState> {
  AugmentedRealityBloc() : super(AugmentedRealityInitial()) {
    on<AugmentedRealityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
