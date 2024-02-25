part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserUnauthenticated extends UserState {}

final class UserAuthenticated extends UserState {
  final AppUser user;
  const UserAuthenticated({
    required this.user,
  });

  @override
  List<Object> get props => [user];

  UserAuthenticated copyWith({
    AppUser? user,
  }) {
    return UserAuthenticated(
      user: user ?? this.user,
    );
  }
}
