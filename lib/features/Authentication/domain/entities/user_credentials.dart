import 'package:equatable/equatable.dart';

class UserCredentials extends Equatable {
  final String accessToken;
  final String email;
  const UserCredentials({
    required this.accessToken,
    required this.email,
  });

  @override
  List<Object?> get props {
    return [
      accessToken,
      email,
    ];
  }
}
