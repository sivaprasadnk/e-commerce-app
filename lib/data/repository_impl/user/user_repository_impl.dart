import 'package:e_comm_app/data/data_source/user/user_local_data_source.dart';
import 'package:e_comm_app/data/data_source/user/user_remote_data_source.dart';
import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/data/model/user/user_model.dart';
import 'package:e_comm_app/domain/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSourceImpl userLocalDataSource;
  final UserRemoteDataSourceImpl userRemoteDataSource;
  UserRepositoryImpl(this.userLocalDataSource, this.userRemoteDataSource);

  @override
  Future saveUserDetails(UserModel user) async {
    await userRemoteDataSource.addToDatabase(user);
    return await userLocalDataSource.saveUserDetails(user);
  }

  @override
  Future<UserModel> getUserDetails() async {
    return await userLocalDataSource.getUserDetails();
  }

  @override
  Future addToWishList(ProductModel product) async {
    var user = await userLocalDataSource.getUserDetails();
    var userId = user.userId;
    return await userRemoteDataSource.addToWishList(product, userId);
  }

  @override
  Future<List<ProductModel>> getWishListProducts() async {
    var user = await userLocalDataSource.getUserDetails();
    return await userRemoteDataSource.getWishListProducts(user);
  }

  @override
  Future removeFromWishList(ProductModel product) async {
    var user = await userLocalDataSource.getUserDetails();
    return await userRemoteDataSource.removeFromWishList(product, user.userId);
  }

  @override
  Future<bool> checkIfWishListed(ProductModel product) async {
    var user = await userLocalDataSource.getUserDetails();
    return await userRemoteDataSource.checkIfWishListed(product, user.userId);
  }
}
