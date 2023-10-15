import 'package:dartz/dartz.dart';
import 'package:tup_ar/core/errors/failure.dart';
import 'package:tup_ar/features/Authentication/domain/entities/user_data.dart';

abstract interface class RegistrationRepository {
  Future<Either<RegistrationFailure, UserData>> registerWithEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}
