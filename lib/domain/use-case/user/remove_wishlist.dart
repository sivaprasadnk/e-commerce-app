import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/data/repository_impl/user/user_repository_impl.dart';

class RemoveWishlist {
  final UserRepositoryImpl repository;
  RemoveWishlist(this.repository);
  Future call(ProductModel product) async {
    return await repository.removeFromWishList(product);
  }
}
