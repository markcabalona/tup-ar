import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/features/Faqs/domain/entities/faq.dart';

part 'faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState> {
  FaqsCubit() : super(FaqsInitial());

  Future<void> fetchFaqs() async {
    // TODO: fetch faqs from datasource
    Future.delayed(
      const Duration(seconds: 1),
      () {
        emit(
          const FaqsLoaded(
            faqs: [],
          ),
        );
      },
    );
  }
}
