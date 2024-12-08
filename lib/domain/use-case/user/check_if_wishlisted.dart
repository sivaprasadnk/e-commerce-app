import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/data/repository_impl/user/user_repository_impl.dart';

class CheckIfWishlisted {
  final UserRepositoryImpl repository;
  CheckIfWishlisted(this.repository);
  Future<bool> call(ProductModel product) async {
    return await repository.checkIfWishListed(product);
  }
}
