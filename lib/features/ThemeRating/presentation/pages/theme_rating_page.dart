import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/core/cubits/background_tasks_cubit.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';
import 'package:tup_ar/features/ThemeRating/presentation/bloc/theme_rating_bloc.dart';
import 'package:tup_ar/features/ThemeRating/presentation/widgets/comments/theme_rating_comment_list.dart';
import 'package:tup_ar/features/ThemeRating/presentation/widgets/ratings/theme_ratings_widget.dart';

class ThemeRatingPage extends StatelessWidget {
  const ThemeRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeRatingBloc, ThemeRatingState>(
      buildWhen: _buildWhen,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.eventPlace?.name ?? '',
            ),
            actions: [
              if (state.eventPlace != null)
                IconButton(
                  onPressed: () {
                    // TODO: navigate to add-rating page
                  },
                  icon: const Icon(Icons.add),
                ),
            ],
          ),
          body: _buildPageBody(state),
        );
      },
    );
  }

  bool _buildWhen(previous, current) {
    final backgroundTaskCubit = GetIt.instance<BackgroundTasksCubit>();
    if (current is ThemeRatingsLoaded) {
      backgroundTaskCubit.onIdle();
    }
    if (current is ThemeRatingsError) {
      backgroundTaskCubit.onErrorOccurred(
        current.message,
      );
    } else if (current is ThemeRatingInitial) {
      backgroundTaskCubit.onLoading('Fetching theme ratings...');
    }
    return current is ThemeRatingsLoaded || current is ThemeRatingsError;
  }

  Widget _buildPageBody(ThemeRatingState state) {
    final List<ThemeRating> ratings;
    if (state is! ThemeRatingsLoaded) {
      ratings = [];
    } else {
      ratings = state.themeRatings;
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ThemeRatingsWidget(
            ratings: ratings,
          ),
          ThemeRatingCommentList(
            ratings: ratings
                .where(
                  (element) => element.comment?.isNotEmpty == true,
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
