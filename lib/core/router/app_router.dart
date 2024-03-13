import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tup_ar/core/cubits/background_tasks_cubit.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/core/router/routes/authentication.dart';
import 'package:tup_ar/core/router/routes/events_places.dart';
import 'package:tup_ar/core/router/routes/faqs_routes.dart';
import 'package:tup_ar/core/widgets/background_tasks_listener.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/authentication_state_listener.dart';
import 'package:tup_ar/features/Faqs/presentation/cubit/faqs_cubit.dart';

abstract class AppRouter {
  static final GoRouteInformationParser routeInformationParser =
      _router.routeInformationParser;

  static final GoRouteInformationProvider routeInformationProvider =
      _router.routeInformationProvider;

  static final GoRouterDelegate routerDelegate = _router.routerDelegate;

  static final _router = GoRouter(
    initialLocation: AppRoutes.login.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetIt.instance<BackgroundTasksCubit>(),
            ),
            BlocProvider(
              create: (context) => GetIt.instance<AuthenticationBloc>()
                ..add(CheckUserLoginEvent()),
            ),
            BlocProvider(
              create: (context) => GetIt.instance<FaqsCubit>(),
            ),
          ],
          child: AuthenticationStateListener(
            child: BackgroundTasksListener(
              child: child,
            ),
          ),
        ),
        routes: [
          ShellRoute(
            routes: AuthenticationRoutes.routes,
            builder: (context, state, child) => child,
          ),
          ShellRoute(
            builder: (context, state, child) => child,
            routes: EventsPlacesRoutes.routes,
          ),
          ShellRoute(
            routes: FaqsRoutes.routes,
            builder: (context, state, child) => child,
          ),
        ],
      ),
    ],
  );

  static void go<T>(
    AppRoutes route, {
    T? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    _router.goNamed(
      route.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static Future<T?> push<T extends Object?>(
    AppRoutes route, {
    Object? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    return _router.pushNamed<T>(
      route.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static void replace<T>(
    AppRoutes route, {
    T? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    _router.replaceNamed(
      route.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static void pushReplacement<T>(
    AppRoutes route, {
    T? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    _router.pushReplacementNamed(
      route.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static void pop<T extends Object?>([T? result]) {
    _router.pop(result);
  }
}
