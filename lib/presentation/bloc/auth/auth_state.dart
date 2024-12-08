import 'package:e_comm_app/data/model/user/user_model.dart';

class AuthState {
  final bool? isLoggedIn;
  final UserModel? userDetails;
  AuthState({
    this.isLoggedIn,
    this.userDetails,
  });

  AuthState copyWith({bool? status, UserModel? user}) {
    return AuthState(
      isLoggedIn: status ?? isLoggedIn,
      userDetails: user ?? userDetails,
    );
  }
}
