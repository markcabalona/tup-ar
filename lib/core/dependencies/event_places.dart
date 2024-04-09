import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/features/EventPlaces/data/datasources/companies_datasource.dart';
import 'package:tup_ar/features/EventPlaces/data/datasources/events_place_datasource.dart';
import 'package:tup_ar/features/EventPlaces/data/repositories/events_place_repository_impl.dart';
import 'package:tup_ar/features/EventPlaces/domain/repositories/events_place_repository.dart';
import 'package:tup_ar/features/EventPlaces/presentation/bloc/event_places_bloc.dart';

void initializeEventPlacesDependencies() {
  final serviceLocator = GetIt.instance;
  serviceLocator.registerLazySingleton<EventsPlaceDatasource>(
    () => EventsPlaceDatasource(
      firestore: FirebaseFirestore.instanceFor(
        app: Firebase.app(
          'tup-ar-web',
        ),
      ),
    ),
  );
  serviceLocator.registerLazySingleton<CompaniesDatasource>(
    () => CompaniesDatasource(
      firestore: FirebaseFirestore.instanceFor(
        app: Firebase.app(
          'tup-ar-web',
        ),
      ),
    ),
  );

  serviceLocator.registerLazySingleton<EventsPlaceRepository>(
    () => EventsPlaceRepositoryImpl(
      eventsPlaceDatasource: serviceLocator(),
      companiesDatasource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<EventPlacesBloc>(() => EventPlacesBloc(
        eventsPlaceRepository: serviceLocator(),
      ));
}
