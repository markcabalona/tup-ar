import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'background_tasks_state.dart';

class BackgroundTasksCubit extends Cubit<BackgroundTasksState> {
  Timer? _timer;
  BackgroundTasksCubit() : super(BackgroundTasksIdle());

  void onIdle() {
    _timer?.cancel();
    emit(BackgroundTasksIdle());
  }

  void onLoading(String? message) {
    _timer?.cancel();
    emit(BackgroundTaskLoading(loadingMessage: message));
  }

  void onSuccess(String? message) {
    emit(BackgroundTaskSuccess(successMessage: message));
    _startTimer();
  }

  void onErrorOccurred(String? message) {
    emit(BackgroundTaskFailed(errorMessage: message));
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(
      const Duration(
        seconds: 2,
      ),
      () {
        onIdle();
      },
    );
  }
}
