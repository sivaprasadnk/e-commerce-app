import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/data/repository_impl/user/user_repository_impl.dart';

class GetWishlist {
  final UserRepositoryImpl repository;
  GetWishlist(this.repository);
  Future<List<ProductModel>> call() async {
    return await repository.getWishListProducts();
  }
}
