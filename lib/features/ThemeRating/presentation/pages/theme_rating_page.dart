import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/core/cubits/background_tasks_cubit.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/ThemeRating/domain/entities/theme_rating.dart';
import 'package:tup_ar/features/ThemeRating/presentation/bloc/theme_rating_bloc.dart';
import 'package:tup_ar/features/ThemeRating/presentation/widgets/comments/theme_rating_comment_list.dart';
import 'package:tup_ar/features/ThemeRating/presentation/widgets/ratings/theme_ratings_widget.dart';

typedef _ThemeRatings = ({EventPlace? eventPlace, List<ThemeRating> ratings});

class ThemeRatingPage extends StatelessWidget {
  const ThemeRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeRatingBloc, ThemeRatingState, _ThemeRatings>(
      selector: _selector,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.eventPlace?.name ?? '',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // TODO: navigate to add-rating page
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const ThemeRatingsWidget(),
                ThemeRatingCommentList(
                  ratings: state.ratings
                      .where(
                        (element) => element.comment?.isNotEmpty == true,
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _ThemeRatings _selector(ThemeRatingState state) {
    final backgroundTaskCubit = GetIt.instance<BackgroundTasksCubit>();
    if (state is ThemeRatingsLoaded) {
      backgroundTaskCubit.onIdle();
      final ratings = state.themeRatings
        ..sort(
          (a, b) {
            return b.createdAt.difference(a.createdAt).inMilliseconds;
          },
        );
      return (eventPlace: state.eventPlace, ratings: ratings);
    }
    if (state is ThemeRatingsError) {
      backgroundTaskCubit.onErrorOccurred(
        state.message,
      );
    } else if (state is ThemeRatingInitial) {
      backgroundTaskCubit.onLoading('Fetching theme ratings...');
    }

    return (eventPlace: state.eventPlace, ratings: []);
  }
}
