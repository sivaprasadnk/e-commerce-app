import 'package:e_comm_app/data/model/product/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
