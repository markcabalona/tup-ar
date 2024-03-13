import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/constants/padding_constants.dart';
import 'package:tup_ar/core/constants/spacer_constants.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';
import 'package:tup_ar/features/ThemeRating/presentation/bloc/theme_rating_bloc.dart';

class AddThemeRatingPage extends StatelessWidget {
  final EventPlace eventPlace;
  const AddThemeRatingPage({
    Key? key,
    required this.eventPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Review'),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ThemeRatingBloc, ThemeRatingState>(
          buildWhen: _buildWhen,
          builder: (context, state) {
            if (state is! AddThemeRatingState) {
              return const SizedBox();
            }
            return Padding(
              padding: PaddingConstants.all,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StarRatingChoicesWidget(),
                  SpacerConstants.vertical,
                  TextFormField(
                    onTapOutside: (event) {
                      Navigator.of(context).focusNode.unfocus();
                    },
                    maxLines: 5,
                    onChanged: (value) {
                      BlocProvider.of<ThemeRatingBloc>(context).add(
                        UpdateAddThemeRatingFormEvent(
                          comment:
                              value.trim().isEmpty ? null : value.toString(),
                        ),
                      );
                    },
                  ),
                  SpacerConstants.vertical,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: state.isAnonymous,
                        onChanged: (value) {
                          BlocProvider.of<ThemeRatingBloc>(context).add(
                            UpdateAddThemeRatingFormEvent(isAnonymous: value),
                          );
                        },
                      ),
                      const Text('Hide profile'),
                    ],
                  ),
                  FilledButton(
                    onPressed: () {
                      BlocProvider.of<ThemeRatingBloc>(context).add(
                        AddThemeRatingEvent(
                          eventPlace: eventPlace,
                          rating: state.rating,
                          comment: state.comment,
                          isAnonymous: state.isAnonymous,
                        ),
                      );
                    },
                    child: const Text('Submit Review'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool _buildWhen(ThemeRatingState previous, ThemeRatingState current) {
    if (current is AddThemeRatingSuccessState) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        AppRouter.pop(true);
      });
      return false;
    }
    return current is AddThemeRatingState;
  }
}

class StarRatingChoicesWidget extends StatelessWidget {
  const StarRatingChoicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const _StarRatingWidget();
  }
}

class _StarRatingWidget extends StatelessWidget {
  final int max;
  const _StarRatingWidget({
    Key? key,
    // ignore: unused_element
    this.max = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeRatingBloc, ThemeRatingState>(
      buildWhen: (previous, current) {
        return current is AddThemeRatingState;
      },
      builder: (context, state) {
        if (state is! AddThemeRatingState) return const SizedBox();
        return Column(
          children: List.generate(
            max,
            (index) {
              final isSelected = max - index == state.rating;
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<ThemeRatingBloc>(context)
                      .add(UpdateAddThemeRatingFormEvent(
                    rating: max - index,
                  ));
                },
                child: Container(
                  padding: PaddingConstants.horizontal,
                  margin: PaddingConstants.vertical,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor,
                        style:
                            isSelected ? BorderStyle.solid : BorderStyle.none,
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      max - index,
                      (i) => Icon(
                        Icons.star,
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    )..add(
                        Expanded(
                          child: AutoSizeText(
                            _buildText(max - index),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  String _buildText(int rating) => switch (rating) {
        (int rating) when rating == 1 => 'Sobrang Pangit',
        (int rating) when rating == 2 => 'Pangit',
        (int rating) when rating == 3 => 'Puwede na',
        (int rating) when rating == 4 => 'Maganda',
        (int rating) when rating == 5 => 'Sobrang Ganda',
        (_) => '',
      };
}
