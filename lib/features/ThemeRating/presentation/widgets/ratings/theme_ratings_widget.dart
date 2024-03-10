import 'package:flutter/material.dart';
import 'package:tup_ar/core/constants/padding_constants.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';

part '_average_rating_widget.dart';
part '_detailed_ratings_widget.dart';
part '_star_rating_widget.dart';

class ThemeRatingsWidget extends StatelessWidget {
  final List<ThemeRating> ratings;
  const ThemeRatingsWidget({
    Key? key,
    required this.ratings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: PaddingConstants.all,
        child: Column(
          children: [
            Text(
              'Theme Ratings',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            _AverageRatingWidget(ratings: ratings),
            Text('${ratings.length} user ratings'),
            _DetailedRatingsWidget(
              ratings: ratings,
            ),
          ],
        ),
      ),
    );
  }
}
