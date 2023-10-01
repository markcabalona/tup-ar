import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/cubits/background_tasks_cubit.dart';

class BackgroundTasksListener extends StatelessWidget {
  final Widget child;
  const BackgroundTasksListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BackgroundTasksCubit, BackgroundTasksState>(
      listener: (context, state) {
        if (state is BackgroundTaskLoading) {
          // TODO: show loading UI
        } else if (state is BackgroundTaskSuccess) {
          // TODO: show success UI
        } else if (state is BackgroundTaskFailed) {
          // TODO: show error UI
        }
      },
      child: child,
    );
  }
}
