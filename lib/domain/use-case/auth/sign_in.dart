import 'package:e_comm_app/data/repository_impl/auth/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn {
  final AuthRepositoryImpl authRepository;
  SignIn(this.authRepository);

  Future<UserCredential?> call() async {
    debugPrint('@@ SignI use case');
    return authRepository.signIn();
  }
}
