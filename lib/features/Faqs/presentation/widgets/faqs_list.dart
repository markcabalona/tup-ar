import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/core/cubits/background_tasks_cubit.dart';
import 'package:tup_ar/features/Faqs/domain/entities/faq.dart';
import 'package:tup_ar/features/Faqs/presentation/cubit/faqs_cubit.dart';

class FaqsList extends StatelessWidget {
  const FaqsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FaqsCubit, FaqsState, List<Faq>>(
      selector: _selector,
      builder: (context, state) {
        return const Placeholder(
          child: Center(child: Text('Faqs')),
        );
      },
    );
  }

  List<Faq> _selector(state) {
      final backgroundTaskCubit = GetIt.instance<BackgroundTasksCubit>();
      if (state is FaqsLoaded) {
        backgroundTaskCubit.onIdle();
        return state.faqs;
      }
      if (state is FaqsError) {
        backgroundTaskCubit.onErrorOccurred(
          state.message,
        );
      } else if (state is FaqsInitial) {
        backgroundTaskCubit.onLoading('Fetching faqs...');
        GetIt.instance<FaqsCubit>().fetchFaqs();
      }
  
      return [];
    }
}
