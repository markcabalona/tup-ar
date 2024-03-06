import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/EventPlaces/presentation/pages/event_place_view.dart';
import 'package:tup_ar/features/EventPlaces/presentation/pages/event_places_page.dart';

abstract class EventsPlacesRoutes {
  static final routes = [
    _eventsPlaceList,
  ];

  static final _eventsPlaceList = GoRoute(
    name: AppRoutes.eventsPlaces.name,
    path: AppRoutes.eventsPlaces.path,
    pageBuilder: (context, state) => const MaterialPage(
      child: EventPlacesPage(),
    ),
    routes: [
      GoRoute(
        name: AppRoutes.singleEventsPlace.name,
        path: AppRoutes.singleEventsPlace.path,
        redirect: (context, state) {
          if (state.extra is! EventPlace) {
            return AppRoutes.pageNotFound.path;
          }
          return null;
        },
        pageBuilder: (context, state) {
          return MaterialPage(
            child: EventPlaceView(
              eventPlace: state.extra as EventPlace,
            ),
          );
        },
      ),
    ],
  );
}
