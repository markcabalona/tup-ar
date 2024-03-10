import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/constants/padding_constants.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';
import 'package:tup_ar/features/ThemeRating/presentation/bloc/theme_rating_bloc.dart';

part '_average_rating_widget.dart';
part '_detailed_ratings_widget.dart';
part '_star_rating_widget.dart';

class ThemeRatingsWidget extends StatelessWidget {
  const ThemeRatingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: PaddingConstants.all,
        child:
            BlocSelector<ThemeRatingBloc, ThemeRatingState, List<ThemeRating>>(
          selector: (state) {
            if (state is ThemeRatingsLoaded) {
              return state.themeRatings;
            }
            return [];
          },
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  'Theme Ratings',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                _AverageRatingWidget(ratings: state),
                Text('${state.length} user ratings'),
                _DetailedRatingsWidget(
                  ratings: state,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

