import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/data/repository_impl/user/user_repository_impl.dart';

class AddToWishlist {
  final UserRepositoryImpl userRepository;
  AddToWishlist(this.userRepository);
  Future call(ProductModel product) async {
    return await userRepository.addToWishList(product);
  }
}
