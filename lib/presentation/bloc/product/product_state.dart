import 'package:e_comm_app/data/model/product/product_model.dart';

class ProductState {
  List<ProductModel>? products;
  ProductState({this.products = const []});
  ProductState copyWith({List<ProductModel>? list}) {
    return ProductState(
      products: list ?? products,
    );
  }
}
