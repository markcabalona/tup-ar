import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/Faqs/domain/entities/faq.dart';

abstract interface class FaqsRepository {
  Future<Either<FaqsFailure, List<Faq>>> fetchFaqs();
}
