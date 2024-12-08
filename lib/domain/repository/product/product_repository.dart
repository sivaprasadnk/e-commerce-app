import 'package:e_comm_app/data/model/product/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
}
