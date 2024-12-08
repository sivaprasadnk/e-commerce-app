import 'package:e_comm_app/domain/use-case/product/get_products.dart';
import 'package:e_comm_app/domain/use-case/product/get_wishlist.dart';
import 'package:e_comm_app/domain/use-case/user/remove_wishlist.dart';
import 'package:e_comm_app/presentation/bloc/product/product_event.dart';
import 'package:e_comm_app/presentation/bloc/product/product_state.dart';
import 'package:e_comm_app/utils/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on(getProducts);
    on(getWishList);
  }

  Future getProducts(GetProductsEvent event, Emitter<ProductState> emit) async {
    var list = await locator<GetProducts>().call();
    emit(state.copyWith(list: list));
  }

  Future getWishList(
      GetWishListProductsEvent event, Emitter<ProductState> emit) async {
    var list = await locator<GetWishlist>().call();
    emit(state.copyWith(wishList: list));
  }

  Future removeFromWishList(
      RemoveWishListProductEvent event, Emitter<ProductState> emit) async {
    await locator<RemoveWishlist>().call(event.product);
    var list = state.wishlistProducts!;
    list.removeWhere((element) => element.sku == event.product.sku);
    emit(state.copyWith(wishList: list));
  }
}
