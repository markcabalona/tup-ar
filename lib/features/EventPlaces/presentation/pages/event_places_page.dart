import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/padding_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/features/Authentication/presentation/widgets/authenticated/dashboard_drawer.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';

class EventPlacesPage extends StatelessWidget {
  const EventPlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DashboardDrawer(),
      appBar: AppBar(
        title: const Text('vAR'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: List.generate(
          10,
          (index) => EventPlace(
            id: '${index + 1}',
            name: "Event Place ${index + 1}",
            description:
                'This is a test description for event place ${index + 1}',
          ),
        )
            .map(
              (e) => EventsPlaceCardWidget(
                eventPlace: e,
              ),
            )
            .toList(),
      ),
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
        child: Center(
          child: Text(eventPlace.name),
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
