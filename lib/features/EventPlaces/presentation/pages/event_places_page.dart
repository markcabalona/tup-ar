
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/core/utils/state_status_enum.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/authenticated/dashboard_drawer.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/EventPlaces/presentation/bloc/event_places_bloc.dart';
import 'package:tup_ar_core/constants/padding_constants.dart';
import 'package:tup_ar_core/constants/spacer_constants.dart';
import 'package:tup_ar_core/cubits/background_tasks_cubit.dart';

class EventPlacesPage extends StatelessWidget {
  const EventPlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DashboardDrawer(),
      appBar: AppBar(
        title: const Text('vAR'),
      ),
      body: const EventPlacesList(),
    );
  }
}

class EventPlacesList extends StatelessWidget {
  const EventPlacesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EventPlacesBloc, EventPlacesState,
        FetchEventsPlacesState>(
      selector: (state) {
        return state is FetchEventsPlacesState
            ? state
            : const FetchEventsPlacesState(
                status: StateStatus.initial,
              );
      },
      builder: (context, state) {
        switch (state.status) {
          case StateStatus.initial:
            BlocProvider.of<EventPlacesBloc>(context).add(
              const FetchEventPlacesEvent(),
            );
            break;
          case StateStatus.loading:
            BackgroundTask.instance.cubit.onLoading(
              state.statusMessage,
            );
            break;
          case StateStatus.error:
            BackgroundTask.instance.cubit.onErrorOccurred(
              state.statusMessage,
            );
            break;
          case StateStatus.success:
            BackgroundTask.instance.cubit.onSuccess(
              state.statusMessage,
            );

            return ListView.builder(
              itemCount: state.eventPlaces?.length ?? 0,
              itemBuilder: (context, index) => EventsPlaceCardWidget(
                eventPlace: state.eventPlaces![index],
              ),
            );
        }
        return const SizedBox();
      },
    );
  }
}

class EventsPlaceCardWidget extends StatelessWidget {
  final EventPlace eventPlace;
  const EventsPlaceCardWidget({
    Key? key,
    required this.eventPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTapCard(context);
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: 200,
          // width: 300,
          child: Stack(
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(
                    // color: VarColors.cardColorLight.withOpacity(.25),
                    ),
                child: SizedBox.expand(),
              ),
              if (eventPlace.thumbnailUrl != null)
                Center(
                  child: Image.network(
                    eventPlace.thumbnailUrl!,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: PaddingConstants.all,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        eventPlace.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapCard(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: PaddingConstants.largeAll,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  eventPlace.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SpacerConstants.largeVertical,
                FilledButton(
                  onPressed: _onTapViewSimulation,
                  child: const Text("View Simulation"),
                ),
                SpacerConstants.vertical,
                OutlinedButton(
                  onPressed: _onTapViewRatings,
                  child: const Text("See Ratings"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _onTapViewSimulation() {
    AppRouter.pop();
    AppRouter.push(
      AppRoutes.singleEventsPlace,
      extra: eventPlace,
      pathParameters: {
        'id': eventPlace.id,
      },
    );
  }

  void _onTapViewRatings() {
    AppRouter.pop();
    AppRouter.push(
      AppRoutes.themeRating,
      extra: eventPlace,
      pathParameters: {
        'id': eventPlace.id,
      },
    );
  }
}
