import 'package:e_comm_app/data/data_source/auth/auth_local_data_source.dart';
import 'package:e_comm_app/data/data_source/auth/auth_remote_data_source.dart';
import 'package:e_comm_app/data/data_source/product/product_remote_data_source.dart';
import 'package:e_comm_app/data/data_source/user/user_local_data_source.dart';
import 'package:e_comm_app/data/repository_impl/auth/auth_repository_impl.dart';
import 'package:e_comm_app/data/repository_impl/product/product_repository_impl.dart';
import 'package:e_comm_app/data/repository_impl/user/user_repository_impl.dart';
import 'package:e_comm_app/domain/use-case/auth/check_is_logged_in.dart';
import 'package:e_comm_app/domain/use-case/auth/sign_in.dart';
import 'package:e_comm_app/domain/use-case/auth/sign_out.dart';
import 'package:e_comm_app/domain/use-case/product/get_products.dart';
import 'package:e_comm_app/domain/use-case/user/save_user_details.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setup() {
  /// remote datasource
  locator
      .registerSingleton<AuthRemoteDataSourceImpl>(AuthRemoteDataSourceImpl());
  locator.registerSingleton<ProductRemoteDataSourceImpl>(
      ProductRemoteDataSourceImpl());

  /// local datasource
  locator.registerSingleton<UserLocalDataSourceImpl>(UserLocalDataSourceImpl());
  locator.registerSingleton<AuthLocalDataSourceImpl>(AuthLocalDataSourceImpl());

  /// repository
  locator.registerSingleton<AuthRepositoryImpl>(
      AuthRepositoryImpl(locator(), locator()));
  locator.registerSingleton<UserRepositoryImpl>(UserRepositoryImpl(locator()));
  locator.registerSingleton<ProductRepositoryImpl>(
      ProductRepositoryImpl(locator()));

  /// use-case
  locator.registerSingleton<SignIn>(SignIn(locator()));
  locator.registerSingleton<SignOut>(SignOut(locator()));
  locator.registerSingleton<SaveUserDetails>(SaveUserDetails(locator()));
  locator.registerSingleton<CheckIsLoggedIn>(CheckIsLoggedIn(locator()));
  locator.registerSingleton<GetProducts>(GetProducts(locator()));
}
