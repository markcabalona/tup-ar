import 'package:tup_ar/features/Authentication/data/models/user_data_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserDataModel> registerWithEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });

  Future<UserDataModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
