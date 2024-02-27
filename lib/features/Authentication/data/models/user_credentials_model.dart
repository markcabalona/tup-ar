import 'package:tup_ar/features/Authentication/domain/entities/user_credentials.dart';

class UserCredentialsModel extends UserCredentials {
  const UserCredentialsModel({
    required super.accessToken,
    required super.email,
    super.profileImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'email': email,
      'profile_image': profileImage,
    };
  }

  factory UserCredentialsModel.fromMap(Map<String, dynamic> map) {
    return UserCredentialsModel(
      accessToken: map['accessToken'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['profile_image'],
    );
  }
}
