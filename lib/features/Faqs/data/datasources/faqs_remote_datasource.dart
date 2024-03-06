import 'package:tup_ar/features/Faqs/domain/entities/faq.dart';

abstract interface class FaqsRemoteDatasource {
  Future<List<Faq>> fetchFaqs();
}
