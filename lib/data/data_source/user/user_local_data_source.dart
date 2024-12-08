import 'package:e_comm_app/data/model/user/user_model.dart';
import 'package:e_comm_app/utils/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future saveUserDetails(UserModel user);
  Future<UserModel> getUserDetails();
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  @override
  Future saveUserDetails(UserModel user) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool(isLoggedInKey, true);
    sharedPrefs.setString(emailKey, user.email);
    sharedPrefs.setString(userIdKey, user.userId);
  }

  @override
  Future<UserModel> getUserDetails() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return UserModel(
      userId: sharedPrefs.getString(userIdKey) ?? "",
      email: sharedPrefs.getString(emailKey) ?? "",
    );
  }
}
