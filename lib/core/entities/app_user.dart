import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String? profileImage;
  const AppUser({
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

  AppUser copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? profileImage,
  }) {
    return AppUser(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
