import 'package:e_comm_app/data/model/product/product_model.dart';

abstract class ProductEvent {}

class GetProductsEvent extends ProductEvent {}

class GetWishListProductsEvent extends ProductEvent {}

class RemoveWishListProductEvent extends ProductEvent {
  final ProductModel product;
  RemoveWishListProductEvent(this.product);
}
