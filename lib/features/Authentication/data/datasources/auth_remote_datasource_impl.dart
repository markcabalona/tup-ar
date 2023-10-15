import 'package:firebase_auth/firebase_auth.dart';
import 'package:tup_ar/core/constants/error_message_constants.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/features/Authentication/data/datasources/auth_remote_datasource.dart';
import 'package:tup_ar/features/Authentication/data/models/user_data_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDatasourceImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<UserDataModel> registerWithEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      userCredential.user?.updateDisplayName(
        '$firstName\\$lastName',
      );

      return UserDataModel(
        userId: userCredential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        message: e.message ?? ErrorMessageConstants.serverError,
      );
    }
  }

  @override
  Future<UserDataModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final displayName = userCredential.user?.displayName?.split('\\');

      return UserDataModel(
        userId: userCredential.user!.uid,
        firstName: displayName?.firstOrNull ?? '',
        lastName: displayName?.lastOrNull ?? '',
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        message: ErrorMessageConstants.errorCodes[e.code] ??
            e.message ??
            ErrorMessageConstants.serverError,
      );
    }
  }
}
