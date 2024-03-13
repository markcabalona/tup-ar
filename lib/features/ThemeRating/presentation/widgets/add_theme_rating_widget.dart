import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';
import 'package:tup_ar/features/ThemeRating/presentation/bloc/theme_rating_bloc.dart';

class AddThemeRatingWidget extends StatelessWidget {
  const AddThemeRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeRatingBloc, ThemeRatingState>(
      buildWhen: _buildWhen,
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            AppRouter.push(
              AppRoutes.addThemeRating,
              extra: state.eventPlace,
              pathParameters: {
                'id': state.eventPlace!.id,
              },
            ).then((value) {
              if (value == true) {
                BlocProvider.of<ThemeRatingBloc>(context).add(
                  FetchThemeRatingsEvent(
                    eventPlace: state.eventPlace!,
                  ),
                );
              }
            });
          },
          icon: const Icon(Icons.add),
        );
      },
    );
  }

  bool _buildWhen(previous, current) =>
      current is ThemeRatingsLoaded || current is ThemeRatingsError;
}
