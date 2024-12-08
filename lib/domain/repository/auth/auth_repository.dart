import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential?> signIn();
  Future<void> signOut();
  Future<bool> checkIsLoggedIn();
}
