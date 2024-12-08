import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential?> signIn();
  Future signOut();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  static final auth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> signIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.standard(
      scopes: [
        'email',
      ],
    );

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return userCredential;
      // return await updateUserData(userCredential);
    } else {
      return null;
    }
  }

  @override
  Future signOut() async {
    return await auth.signOut();
  }
}
