part of 'theme_ratings_widget.dart';

class _DetailedRatingsWidget extends StatelessWidget {
  final List<ThemeRating> ratings;
  const _DetailedRatingsWidget({
    Key? key,
    required this.ratings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(5, (index) {
        final rating = 5 - index;
        return Card(
          color: Theme.of(context).colorScheme.onSecondary,
          child: Container(
            padding: PaddingConstants.all,
            constraints: const BoxConstraints(minWidth: 70),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _StarRatingWidget(
                  rating: rating.toDouble(),
                  max: rating,
                ),
                Text('(${countTotalReviews(rating: rating)})'),
              ],
            ),
          ),
        );
      }),
    );
  }

  int countTotalReviews({required int rating}) {
    return ratings.where((element) => element.rating == rating).length;
  }
}
