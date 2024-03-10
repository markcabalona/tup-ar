part of 'theme_ratings_widget.dart';

class _StarRatingWidget extends StatelessWidget {
  final double rating;
  final int max;
  const _StarRatingWidget({
    Key? key,
    required this.rating,
    this.max = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            max,
            (index) => Icon(
              _buildStarIcon(rating, index),
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }

  IconData _buildStarIcon(double averageRating, int index) {
    final ratingToInt = averageRating.toInt();
    final hasDecimal = ratingToInt != averageRating;

    if (index < ratingToInt) {
      return Icons.star;
    } else if (index > ratingToInt) {
      return Icons.star_outline;
    }
    return hasDecimal ? Icons.star_half : Icons.star_outline;
  }
}
