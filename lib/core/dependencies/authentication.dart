import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/features/Authentication/data/datasources/auth_remote_datasource.dart';
import 'package:tup_ar/features/Authentication/data/datasources/auth_remote_datasource_impl.dart';
import 'package:tup_ar/features/Authentication/data/repositories/login_repository_impl.dart';
import 'package:tup_ar/features/Authentication/data/repositories/registration_repository_impl.dart';
import 'package:tup_ar/features/Authentication/domain/repositories/login_repository.dart';
import 'package:tup_ar/features/Authentication/presentation/bloc/authentication_bloc.dart';

void initialzieAuthDependencies() {
  final serviceLocator = GetIt.instance;
  serviceLocator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(
      firebaseAuth: FirebaseAuth.instance,
    ),
  );
  serviceLocator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        remoteDatasource: serviceLocator(),
      ),);

  serviceLocator.registerLazySingleton<AuthenticationBloc>(
    () => AuthenticationBloc(
      registrationRepository: RegistrationRepositoryImpl(
        remoteDatasource: serviceLocator(),
      ),
      loginRepository: serviceLocator(),
    ),
  );
}
