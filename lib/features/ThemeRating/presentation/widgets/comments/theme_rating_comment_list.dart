import 'package:flutter/material.dart';
import 'package:tup_ar/core/widgets/user_profile_image.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';
import 'package:tup_ar_core/constants/grid_constants.dart';
import 'package:tup_ar_core/constants/padding_constants.dart';
import 'package:tup_ar_core/constants/spacer_constants.dart';
import 'package:tup_ar_core/utils/date_time_extension.dart';

part '_rating_comment_widget.dart';

class ThemeRatingCommentList extends StatelessWidget {
  final List<ThemeRating> ratings;
  const ThemeRatingCommentList({
    Key? key,
    required this.ratings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ratings
          .map(
            (e) => Padding(
              padding: PaddingConstants.all,
              child: _RatingCommentWidget(
                rating: e,
              ),
            ),
          )
          .toList(),
    );
  }
}
