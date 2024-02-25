import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tup_ar/core/entities/app_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserUnauthenticated());

  void onUserAuthenticated({
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    String? profileImage,
  }) {
    emit(
      UserAuthenticated(
        user: AppUser(
          userId: userId,
          firstName: firstName,
          lastName: lastName,
          email: email,
          profileImage: profileImage,
        ),
      ),
    );
  }

  void onUserUnauthenticated() {
    emit(UserUnauthenticated());
  }
}
