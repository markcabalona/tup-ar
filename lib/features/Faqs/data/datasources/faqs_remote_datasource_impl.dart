
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/features/Faqs/data/datasources/faqs_remote_datasource.dart';
import 'package:tup_ar/features/Faqs/data/models/faq_model.dart';
import 'package:tup_ar/features/Faqs/domain/entities/faq.dart';

class FaqsRemoteDatasourceImpl implements FaqsRemoteDatasource {
  final FirebaseFirestore _firestore;

  const FaqsRemoteDatasourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<List<Faq>> fetchFaqs() async {
    try {
      final querySnapshot =
          await _firestore.collection('faqs_collection').get();
      return querySnapshot.docs.map((e) {
        return FaqModel.fromMap(e.data()
          ..addEntries(
            {'id': e.id}.entries,
          ));
      }).toList();
    } catch (e) {
      throw FaqsException(message: e.toString());
    }
  }
}
