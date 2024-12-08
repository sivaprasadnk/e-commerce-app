import 'package:e_comm_app/data/model/user/user_model.dart';
import 'package:e_comm_app/data/repository_impl/user/user_repository_impl.dart';

class SaveUserDetails {
  final UserRepositoryImpl userRepository;
  SaveUserDetails(this.userRepository);

  Future call(UserModel user) async {
    return await userRepository.saveUserDetails(user);
  }
}
