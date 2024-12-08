import 'package:e_comm_app/data/repository_impl/auth/auth_repository_impl.dart';

class SignOut {
  final AuthRepositoryImpl authRepository;
  SignOut(this.authRepository);

  Future call() async {
    return authRepository.signOut();
  }
}
