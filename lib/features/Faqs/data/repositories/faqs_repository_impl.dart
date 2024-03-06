import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/Faqs/data/datasources/faqs_remote_datasource.dart';
import 'package:tup_ar/features/Faqs/domain/entities/faq.dart';
import 'package:tup_ar/features/Faqs/domain/repositories/faqs_repository.dart';

class FaqsRepositoryImpl implements FaqsRepository {
  final FaqsRemoteDatasource _faqsRemoteDatasource;

  const FaqsRepositoryImpl({
    required FaqsRemoteDatasource faqsRemoteDatasource,
  }) : _faqsRemoteDatasource = faqsRemoteDatasource;

  @override
  Future<Either<FaqsFailure, List<Faq>>> fetchFaqs() async {
    try {
      return Right(await _faqsRemoteDatasource.fetchFaqs());
    } on FaqsException catch (e) {
      return Left(
        FaqsFailure(
          errorMessage: e.message,
        ),
      );
    }
  }
}
