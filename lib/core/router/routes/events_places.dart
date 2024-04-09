import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/features/Authentication/domain/repositories/login_repository.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/EventPlaces/presentation/bloc/event_places_bloc.dart';
import 'package:tup_ar/features/EventPlaces/presentation/pages/event_place_view.dart';
import 'package:tup_ar/features/EventPlaces/presentation/pages/event_places_page.dart';
import 'package:tup_ar/features/ThemeRating/domain/repositories/theme_ratings_repository.dart';
import 'package:tup_ar/features/ThemeRating/presentation/bloc/theme_rating_bloc.dart';
import 'package:tup_ar/features/ThemeRating/presentation/pages/add_theme_rating_page.dart';
import 'package:tup_ar/features/ThemeRating/presentation/pages/theme_rating_page.dart';

abstract class EventsPlacesRoutes {
  static final routes = [
    _eventsPlaceList,
  ];

  static final _eventsPlaceList = GoRoute(
    name: AppRoutes.eventsPlaces.name,
    path: AppRoutes.eventsPlaces.path,
    pageBuilder: (context, state) => MaterialPage(
      child: BlocProvider(
        create: (context) => GetIt.instance<EventPlacesBloc>(),
        child: const EventPlacesPage(),
      ),
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
      GoRoute(
        name: AppRoutes.themeRating.name,
        path: AppRoutes.themeRating.path,
        redirect: (context, state) {
          if (state.extra is! EventPlace) {
            return AppRoutes.pageNotFound.path;
          }
          return null;
        },
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider(
            create: (context) => ThemeRatingBloc(
              themeRatingsRepository: GetIt.instance<ThemeRatingsRepository>(),
              loginRepository: GetIt.instance<LoginRepository>(),
            )..add(
                FetchThemeRatingsEvent(
                  eventPlace: state.extra as EventPlace,
                ),
              ),
            child: const ThemeRatingPage(),
          ),
        ),
        routes: [
          GoRoute(
            name: AppRoutes.addThemeRating.name,
            path: AppRoutes.addThemeRating.path,
            redirect: (context, state) {
              if (state.extra is! EventPlace) {
                return AppRoutes.pageNotFound.path;
              }
              return null;
            },
            pageBuilder: (context, state) => MaterialPage(
              child: BlocProvider(
                create: (context) => ThemeRatingBloc(
                  themeRatingsRepository:
                      GetIt.instance<ThemeRatingsRepository>(),
                  loginRepository: GetIt.instance<LoginRepository>(),
                  initialState: const AddThemeRatingState(),
                ),
                child: AddThemeRatingPage(
                  eventPlace: state.extra as EventPlace,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
