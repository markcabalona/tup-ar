
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tup_ar/features/Faqs/domain/entities/faq.dart';

class FaqModel extends Faq {
  const FaqModel({
    required super.id,
    required super.createdAt,
    required super.answer,
    required super.question,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': Timestamp.fromDate(createdAt),
      'question': question,
      'answer': answer,
    };
  }

  factory FaqModel.fromMap(Map<String, dynamic> map) {
    final Timestamp createdAtTimeStamp = map['created_at'];
    return FaqModel(
      id: map['id'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        createdAtTimeStamp.millisecondsSinceEpoch,
      ),
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
    );
  }
}
