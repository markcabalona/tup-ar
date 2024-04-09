import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/EventPlaces/data/datasources/companies_datasource.dart';
import 'package:tup_ar/features/EventPlaces/data/datasources/events_place_datasource.dart';
import 'package:tup_ar/features/EventPlaces/data/models/event_place_model.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/EventPlaces/domain/repositories/events_place_repository.dart';

class EventsPlaceRepositoryImpl implements EventsPlaceRepository {
  final EventsPlaceDatasource eventsPlaceDatasource;
  final CompaniesDatasource companiesDatasource;
  const EventsPlaceRepositoryImpl({
    required this.eventsPlaceDatasource,
    required this.companiesDatasource,
  });
  @override
  Future<Either<EventsPlacesFailure, List<EventPlace>>>
      fetchEventPlaces() async {
    try {
      final response = await eventsPlaceDatasource.fetchEventPlaces();

      final companySlugs = response
          .map(
            (e) => e.companySlug,
          )
          .toSet();
      final eventPlaces = <EventPlaceModel>[];
      for (var slug in companySlugs) {
        final companyDetail = await companiesDatasource.fetchCompanyDetails(
          companySlug: slug,
        );
        final eventPlaces0 = response
            .where(
                (element) => element.companySlug == companyDetail.companySlug)
            .map(
              (e) => e.copyWith(
                companyDetails: companyDetail,
              ),
            );

        eventPlaces.addAll(eventPlaces0);
      }

      return Right(eventPlaces);
    } on EventsPlacesException catch (e) {
      return Left(
        EventsPlacesFailure(errorMessage: e.message),
      );
    }
  }
}
