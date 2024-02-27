import 'package:get_it/get_it.dart';
import 'package:tup_ar/features/Faqs/presentation/cubit/faqs_cubit.dart';

void initializeFaqsDependencies() {
  final serviceLocator = GetIt.instance;

  serviceLocator.registerLazySingleton<FaqsCubit>(
    () => FaqsCubit(),
  );
}
