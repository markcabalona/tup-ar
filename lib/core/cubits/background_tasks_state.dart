part of 'background_tasks_cubit.dart';

sealed class BackgroundTasksState extends Equatable {
  const BackgroundTasksState();

  @override
  List<Object?> get props => [];
}

final class BackgroundTasksIdle extends BackgroundTasksState {}

final class BackgroundTaskLoading extends BackgroundTasksState {
  final String? loadingMessage;
  const BackgroundTaskLoading({
    this.loadingMessage,
  });

  @override
  List<Object?> get props => [loadingMessage];
}

final class BackgroundTaskSuccess extends BackgroundTasksState {
  final String? successMessage;
  const BackgroundTaskSuccess({
    this.successMessage,
  });

  @override
  List<Object?> get props => [successMessage];
}

final class BackgroundTaskFailed extends BackgroundTasksState {
  final String? errorMessage;
  const BackgroundTaskFailed({
    this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}
