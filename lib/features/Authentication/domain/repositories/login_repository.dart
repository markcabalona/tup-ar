import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/Authentication/domain/entities/user_data.dart';

abstract interface class LoginRepository {
  Future<Either<LoginFailure, UserData>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<LoginFailure, UserData>> loginWithGoogle();

  Future<Either<LoginFailure, void>> logout();
}
