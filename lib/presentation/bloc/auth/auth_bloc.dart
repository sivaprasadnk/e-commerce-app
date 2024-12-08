import 'package:e_comm_app/data/model/user/user_model.dart';
import 'package:e_comm_app/domain/use-case/auth/sign_in.dart';
import 'package:e_comm_app/domain/use-case/auth/sign_out.dart';
import 'package:e_comm_app/domain/use-case/user/save_user_details.dart';
import 'package:e_comm_app/presentation/bloc/auth/auth_event.dart';
import 'package:e_comm_app/presentation/bloc/auth/auth_state.dart';
import 'package:e_comm_app/presentation/screens/auth/login/login_screen.dart';
import 'package:e_comm_app/presentation/screens/home/home_screen.dart';
import 'package:e_comm_app/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on(login);
    on(logOut);
  }

  Future login(LoginEvent event, Emitter<AuthState> emit) async {
    var auth = await locator<SignIn>().call();
    if (auth != null) {
      var user = UserModel(
        email: auth.user!.email!,
        userId: auth.user!.uid,
      );
      await locator<SaveUserDetails>().call(user);
      emit(state.copyWith(status: true, user: user));
      debugPrint('## auth email :${user.email}');
      if (event.context.mounted) {
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
      }
    } else {
      debugPrint('## auth is null !!');
    }
  }

  Future logOut(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: false));
    await locator<SignOut>().call();
    if (event.context.mounted) {
      Navigator.push(
        event.context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }
}
