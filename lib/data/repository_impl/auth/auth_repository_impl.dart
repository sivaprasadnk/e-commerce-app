import 'package:e_comm_app/data/data_source/auth/auth_local_data_source.dart';
import 'package:e_comm_app/data/data_source/auth/auth_remote_data_source.dart';
import 'package:e_comm_app/domain/repository/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSourceImpl authRemoteDataSource;
  final AuthLocalDataSourceImpl authLocalDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource, this.authLocalDataSource);
  @override
  Future<UserCredential?> signIn() async {
    try {
      debugPrint('@@ AuthRepositoryImpl signIN');

      return await authRemoteDataSource.signIn();
    } on FirebaseAuthException catch (e) {
      debugPrint('## FirebaseAuthException $e');
      return null;
    } catch (err) {
      debugPrint('## error $err');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await authRemoteDataSource.signOut();
      await authLocalDataSource.updateStatus(false);
    } catch (err) {
      debugPrint('## error $err');
    }
  }

  @override
  Future<bool> checkIsLoggedIn() async {
    try {
      return await authLocalDataSource.checkIsLoggedIn();
    } catch (err) {
      debugPrint('## error $err');
      return false;
    }
  }
}
