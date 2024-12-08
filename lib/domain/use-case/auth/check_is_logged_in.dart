import 'package:e_comm_app/data/repository_impl/auth/auth_repository_impl.dart';

class CheckIsLoggedIn {
  final AuthRepositoryImpl authRepository;
  CheckIsLoggedIn(this.authRepository);
  Future<bool> call() async {
    return await authRepository.checkIsLoggedIn();
  }
}
