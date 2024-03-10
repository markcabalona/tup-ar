part of 'theme_ratings_widget.dart';

class _AverageRatingWidget extends StatelessWidget {
  final List<ThemeRating> ratings;
  const _AverageRatingWidget({
    Key? key,
    required this.ratings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final averageRating = _computeAverageRating(ratings);
    return Card(
      color: Theme.of(context).colorScheme.onSecondary,
      child: Padding(
        padding: PaddingConstants.all,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _StarRatingWidget(
              rating: averageRating,
              max: 5,
            ),
            Text(
              '$averageRating out of 5',
            ),
          ],
        ),
      ),
    );
  }

  double _computeAverageRating(
    List<ThemeRating> ratings,
  ) {
    if (ratings.isEmpty) return 0;
    final sumOfRatings = ratings.fold(
      0,
      (previousValue, element) => previousValue + element.rating,
    );

    return sumOfRatings / ratings.length;
  }
}
