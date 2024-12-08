import 'package:e_comm_app/data/model/user/user_model.dart';

abstract class UserRepository {
  Future saveUserDetails(UserModel user);
  Future<UserModel> getUserDetails();
}
