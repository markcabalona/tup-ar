import 'package:tup_ar/features/Authentication/domain/entities/user_data.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    required super.userId,
    required super.firstName,
    required super.lastName,
    required super.email,
    super.profileImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profileImage': profileImage,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      userId: map['userId'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['profileImage'],
    );
  }
}
