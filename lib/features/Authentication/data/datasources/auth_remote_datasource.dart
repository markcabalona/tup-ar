import 'package:tup_ar/features/Authentication/data/models/user_credentials_model.dart';
import 'package:tup_ar/features/Authentication/data/models/user_data_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserDataModel?> getCurrentUser();

  Future<UserDataModel> registerWithEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });

  Future<UserCredentialsModel> registerWithGoogle();

  Future<UserDataModel> signInWithCredential({
    required String accessToken,
    required String firstName,
    required String lastName,
    String? profileImage,
  });

  Future<UserDataModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserDataModel> loginWithGoogle();

  Future<void> logout();
}
