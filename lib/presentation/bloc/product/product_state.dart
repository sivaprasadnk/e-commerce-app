import 'package:e_comm_app/data/model/product/product_model.dart';

class ProductState {
  List<ProductModel>? products;
  List<ProductModel>? wishlistProducts;
  ProductState({
    this.products = const [],
    this.wishlistProducts = const [],
  });
  ProductState copyWith({
    List<ProductModel>? list,
    List<ProductModel>? wishList,
  }) {
    return ProductState(
      products: list ?? products,
      wishlistProducts: wishList ?? wishlistProducts,
    );
  }
}
