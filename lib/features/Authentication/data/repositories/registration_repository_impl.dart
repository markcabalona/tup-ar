import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/Authentication/data/datasources/auth_remote_datasource.dart';
import 'package:tup_ar/features/Authentication/domain/entities/user_credentials.dart';
import 'package:tup_ar/features/Authentication/domain/entities/user_data.dart';
import 'package:tup_ar/features/Authentication/domain/repositories/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final AuthRemoteDatasource _remoteDatasource;

  const RegistrationRepositoryImpl({
    required AuthRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<RegistrationFailure, UserData>> registerWithEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await _remoteDatasource.registerWithEmail(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      return Right(response);
    } on AuthException catch (e) {
      return Left(
        RegistrationFailure(
          errorMessage: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<RegistrationFailure, UserCredentials>> registerWithGoogle() async {
    try {
      final response = await _remoteDatasource.registerWithGoogle();
      return Right(response);
    } on AuthException catch (e) {
      return Left(
        RegistrationFailure(
          errorMessage: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<RegistrationFailure, UserData>> signInWithCredentials({
    required String accessToken,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await _remoteDatasource.signInWithCredential(
        accessToken: accessToken,
        firstName: firstName,
        lastName: lastName,
      );
      return Right(response);
    } on AuthException catch (e) {
      return Left(
        RegistrationFailure(
          errorMessage: e.message,
        ),
      );
    }
  }
}
