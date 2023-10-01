import 'package:get_it/get_it.dart';
import 'package:tup_ar/core/cubits/background_tasks_cubit.dart';

void initializeBackgroundTasksDependencies() {
  GetIt.instance.registerLazySingleton(
    () => BackgroundTasksCubit(),
  );
}
