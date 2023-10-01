import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'background_tasks_state.dart';

class BackgroundTasksCubit extends Cubit<BackgroundTasksState> {
  BackgroundTasksCubit() : super(BackgroundTasksIdle());

  void onIdle() {
    emit(BackgroundTasksIdle());
  }

  void onLoading(String? message) {
    emit(BackgroundTaskLoading(loadingMessage: message));
  }

  void onSuccess(String? message) {
    emit(BackgroundTaskLoading(loadingMessage: message));
  }

  void onErrorOccurred(String? message) {
    emit(BackgroundTaskLoading(loadingMessage: message));
  }
}
