import 'package:e_comm_app/data/data_source/user/user_local_data_source.dart';
import 'package:e_comm_app/data/model/user/user_model.dart';
import 'package:e_comm_app/domain/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSourceImpl userLocalDataSource;
  UserRepositoryImpl(this.userLocalDataSource);

  @override
  Future saveUserDetails(UserModel user) async {
    return await userLocalDataSource.saveUserDetails(user);
  }

  @override
  Future<UserModel> getUserDetails() async {
    return await userLocalDataSource.getUserDetails();
  }
}
