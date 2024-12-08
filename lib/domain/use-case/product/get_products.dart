import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/data/repository_impl/product/product_repository_impl.dart';

class GetProducts {
  final ProductRepositoryImpl productRepository;
  GetProducts(this.productRepository);
  Future<List<ProductModel>> call() async {
    return await productRepository.getProducts();
  }
}
