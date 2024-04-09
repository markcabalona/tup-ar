import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/features/EventPlaces/data/models/event_place_model.dart';

class EventsPlaceDatasource {
  final FirebaseFirestore firestore;
  const EventsPlaceDatasource({
    required this.firestore,
  });

  Future<List<EventPlaceModel>> fetchEventPlaces() async {
    try {
      final querySnapshot = await firestore.collection('event_places').get();

      return querySnapshot.docs
          .where((element) => element.exists)
          .map((e) => EventPlaceModel.fromMap({
                ...e.data(),
                'id': e.id,
              }))
          .toList();
    } catch (e) {
      log(e.toString());
      throw const EventsPlacesException(message: 'message');
    }
  }
}
