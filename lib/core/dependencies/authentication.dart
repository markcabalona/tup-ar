import 'package:get_it/get_it.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';

void initialzieAuthDependencies() {
  GetIt.instance.registerLazySingleton<AuthenticationBloc>(
    () => AuthenticationBloc(),
  );
}
