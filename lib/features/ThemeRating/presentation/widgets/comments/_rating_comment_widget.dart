part of 'theme_rating_comment_list.dart';

class _RatingCommentWidget extends StatelessWidget {
  final ThemeRating rating;
  const _RatingCommentWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox.square(
              dimension: 32,
              child: UserProfileImage(
                imageUrl: rating.userProfileImage,
              ),
            ),
            SpacerConstants.horizontalSmall,
            Expanded(
              child: Text(
                rating.username ?? 'Anonymous',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SpacerConstants.horizontalSmall,
            Text(
              rating.createdAt.toFormattedString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 32.0 + GridConstants.small,
          ),
          child: Text(
            rating.comment ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
