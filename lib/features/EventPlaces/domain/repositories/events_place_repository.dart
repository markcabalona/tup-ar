import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';

class EventsPlaceRepository {
  const EventsPlaceRepository();

  Future<Either<EventsPlacesFailure, List<EventPlace>>>
      fetchEventPlaces() async => throw UnimplementedError();
}
