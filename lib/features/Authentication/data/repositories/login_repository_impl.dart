import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/exception.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/Authentication/data/datasources/auth_remote_datasource.dart';
import 'package:tup_ar/features/Authentication/domain/entities/user_data.dart';
import 'package:tup_ar/features/Authentication/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthRemoteDatasource _remoteDatasource;

  const LoginRepositoryImpl({
    required AuthRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<LoginFailure, UserData>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDatasource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(response);
    } on AuthException catch (e) {
      return Left(
        LoginFailure(
          errorMessage: e.message,
        ),
      );
    }
  }
}
