import 'package:e_comm_app/data/data_source/product/product_remote_data_source.dart';
import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/domain/repository/product/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSourceImpl productRemoteDataSource;
  ProductRepositoryImpl(this.productRemoteDataSource);
  @override
  Future<List<ProductModel>> getProducts() async {
    return await productRemoteDataSource.getProducts();
  }
}
