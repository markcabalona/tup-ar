import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:tup_ar/features/Faqs/data/datasources/faqs_remote_datasource.dart';
import 'package:tup_ar/features/Faqs/data/datasources/faqs_remote_datasource_impl.dart';
import 'package:tup_ar/features/Faqs/data/repositories/faqs_repository_impl.dart';
import 'package:tup_ar/features/Faqs/presentation/cubit/faqs_cubit.dart';

void initializeFaqsDependencies() {
  final serviceLocator = GetIt.instance;

  serviceLocator.registerLazySingleton<FaqsRemoteDatasource>(
    () => FaqsRemoteDatasourceImpl(
      firestore: FirebaseFirestore.instance,
    ),
  );

  serviceLocator.registerLazySingleton<FaqsCubit>(
    () => FaqsCubit(
      faqsRepository: FaqsRepositoryImpl(
        faqsRemoteDatasource: serviceLocator(),
      ),
    ),
  );
}
