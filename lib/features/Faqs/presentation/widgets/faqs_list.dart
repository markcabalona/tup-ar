import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/core/constants/padding_constants.dart';
import 'package:tup_ar/core/cubits/background_tasks_cubit.dart';
import 'package:tup_ar/features/Faqs/domain/entities/faq.dart';
import 'package:tup_ar/features/Faqs/presentation/cubit/faqs_cubit.dart';

class FaqsList extends StatelessWidget {
  const FaqsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FaqsCubit, FaqsState, List<Faq>>(
      selector: _selector,
      builder: (context, faqs) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ...faqs.map(
                (faq) => FaqWidget(
                  faq: faq,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<Faq> _selector(state) {
    final backgroundTaskCubit = GetIt.instance<BackgroundTasksCubit>();
    GetIt.instance<FaqsCubit>().fetchFaqs();
    if (state is FaqsLoaded) {
      backgroundTaskCubit.onIdle();
      return state.faqs
        ..sort(
          (a, b) {
            return b.createdAt.difference(a.createdAt).inMilliseconds;
          },
        );
    }
    if (state is FaqsError) {
      backgroundTaskCubit.onErrorOccurred(
        state.message,
      );
    } else if (state is FaqsInitial) {
      backgroundTaskCubit.onLoading('Fetching faqs...');
    }

    return [];
  }
}

class FaqWidget extends StatelessWidget {
  final Faq faq;
  const FaqWidget({
    super.key,
    required this.faq,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Card(
        margin: PaddingConstants.all,
        clipBehavior: Clip.hardEdge,
        child: ExpansionTile(
          title: Text(faq.question),
          expandedAlignment: Alignment.centerLeft,
          childrenPadding: PaddingConstants.all,
          children: [
            Padding(
              padding: PaddingConstants.smallHorizontal,
              child: Text(
                faq.answer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
