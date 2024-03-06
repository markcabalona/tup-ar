import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/features/Faqs/domain/entities/faq.dart';
import 'package:tup_ar/features/Faqs/domain/repositories/faqs_repository.dart';

part 'faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState> {
  final FaqsRepository _faqsRepository;

  FaqsCubit({
    required FaqsRepository faqsRepository,
  })  : _faqsRepository = faqsRepository,
        super(FaqsInitial());

  Future<void> fetchFaqs() async {
    final result = await _faqsRepository.fetchFaqs();

    result.fold(
      (failure) {
        emit(FaqsError(
          message: failure.errorMessage,
        ));
      },
      (faqs) {
        emit(FaqsLoaded(
          faqs: faqs,
        ));
      },
    );
  }
}
