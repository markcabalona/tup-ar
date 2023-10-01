import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String? profileImage;
  const UserData({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.profileImage,
  });

  @override
  List<Object?> get props {
    return [
      userId,
      firstName,
      lastName,
      email,
      profileImage,
    ];
  }
}
