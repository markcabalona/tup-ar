import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tup_ar/core/constants/error_message_constants.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/features/Authentication/data/datasources/auth_remote_datasource.dart';
import 'package:tup_ar/features/Authentication/data/models/user_credentials_model.dart';
import 'package:tup_ar/features/Authentication/data/models/user_data_model.dart';

part 'utils/_user_extension.dart';
part 'utils/_utils.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRemoteDatasourceImpl({
    required FirebaseAuth firebaseAuth,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = GoogleSignIn.standard();

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
        toFullName(
          firstName: firstName,
          lastName: lastName,
        ),
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

      final fullName = userCredential.user?.displayName?.toFirstAndLastName();

      return UserDataModel(
        userId: userCredential.user!.uid,
        firstName: fullName?.firstName ?? '',
        lastName: fullName?.lastName ?? '',
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

  @override
  Future<UserDataModel> loginWithGoogle() async {
    try {
      await _signOutGoogle();
      final googleSignInAccount = await _googleSignIn.signIn();
      final googleAuth = await googleSignInAccount?.authentication;

      if (googleAuth == null) {
        throw const AuthException(message: 'Google sign-in failed.');
      }

      final signInMethods = await _firebaseAuth.fetchSignInMethodsForEmail(
        googleSignInAccount!.email,
      );

      if (signInMethods.isEmpty) {
        _googleSignIn.disconnect();
        throw AuthException(
          message: ErrorMessageConstants.errorCodes['USER_NOT_FOUND'] ??
              ErrorMessageConstants.serverError,
        );
      }

      final userCredential = await _firebaseAuth.signInWithCredential(
        AuthCredential(
          providerId: GoogleAuthProvider.PROVIDER_ID,
          signInMethod: GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD,
          accessToken: googleAuth.accessToken,
        ),
      );

      final fullName = userCredential.user?.displayName?.toFirstAndLastName();

      return UserDataModel(
        userId: userCredential.user!.uid,
        firstName: fullName?.firstName ?? '',
        lastName: fullName?.lastName ?? '',
        email: userCredential.user!.email!,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        message: ErrorMessageConstants.errorCodes[e.code] ??
            e.message ??
            ErrorMessageConstants.serverError,
      );
    }
  }

  @override
  Future<UserCredentialsModel> registerWithGoogle() async {
    try {
      await _signOutGoogle();
      final googleSignInAccount = await _googleSignIn.signIn();
      final googleAuth = await googleSignInAccount?.authentication;

      if (googleAuth?.accessToken == null) {
        throw const AuthException(message: 'Google sign-in failed.');
      }

      final signInMethods = await _firebaseAuth.fetchSignInMethodsForEmail(
        googleSignInAccount!.email,
      );

      if (signInMethods.isNotEmpty) {
        _googleSignIn.disconnect();
        throw AuthException(
          message: ErrorMessageConstants.errorCodes['EMAIL_ALREADY_IN_USE'] ??
              ErrorMessageConstants.serverError,
        );
      }

      return UserCredentialsModel(
        accessToken: googleAuth!.accessToken!,
        email: googleSignInAccount.email,
      );
    } catch (exception) {
      if (exception is AuthException) rethrow;
      throw const AuthException(message: ErrorMessageConstants.serverError);
    }
  }

  @override
  Future<UserDataModel> signInWithCredential({
    required String accessToken,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithCredential(
        AuthCredential(
          providerId: GoogleAuthProvider.PROVIDER_ID,
          signInMethod: GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD,
          accessToken: accessToken,
        ),
      );

      userCredential.user?.updateDisplayName(
        toFullName(
          firstName: firstName,
          lastName: lastName,
        ),
      );

      return UserDataModel(
        userId: userCredential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: userCredential.user!.email!,
      );
    } catch (_) {
      throw const AuthException(message: ErrorMessageConstants.serverError);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();

      await _signOutGoogle();

      return;
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        message: ErrorMessageConstants.errorCodes[e.code] ??
            e.message ??
            ErrorMessageConstants.serverError,
      );
    }
  }

  Future<void> _signOutGoogle() async {
    final isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      _googleSignIn.disconnect();
    }
  }

  @override
  Future<UserDataModel?> getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;

      final fullName = user?.displayName?.toFirstAndLastName();

      return UserDataModel(
        userId: user!.uid,
        firstName: fullName?.firstName ?? '',
        lastName: fullName?.lastName ?? '',
        email: user.email ?? '',
      );
    } on FirebaseException catch (e) {
      throw AuthException(
        message: e.message ?? ErrorMessageConstants.serverError,
      );
    } catch (e) {
      throw const AuthException(
        message: 'Something went wrong. Please try again later.',
      );
    }
  }
}
