import 'package:equatable/equatable.dart';

class UserCredentials extends Equatable {
  final String accessToken;
  final String email;
  final String? profileImage;
  const UserCredentials({
    required this.accessToken,
    required this.email,
    required this.profileImage,
  });

  @override
  List<Object?> get props {
    return [
      accessToken,
      email,
      profileImage,
    ];
  }
}
