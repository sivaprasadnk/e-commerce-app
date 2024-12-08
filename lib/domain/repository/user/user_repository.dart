import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/data/model/user/user_model.dart';

abstract class UserRepository {
  Future saveUserDetails(UserModel user);
  Future<UserModel> getUserDetails();
  Future addToWishList(ProductModel product);
  Future<List<ProductModel>> getWishListProducts(UserModel user);
}
