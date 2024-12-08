import 'package:e_comm_app/utils/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> checkIsLoggedIn();
  Future<void> updateStatus(bool value);
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  @override
  Future<bool> checkIsLoggedIn() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool(isLoggedInKey) ?? false;
  }

  @override
  Future<void> updateStatus(bool value) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool(isLoggedInKey, value);
  }
}
