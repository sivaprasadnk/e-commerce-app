import 'package:e_comm_app/presentation/bloc/product/product_bloc.dart';
import 'package:e_comm_app/presentation/bloc/product/product_state.dart';
import 'package:e_comm_app/presentation/components/product_item.dart';
import 'package:e_comm_app/presentation/components/screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const ScreenTitle(title: 'Wish List'),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            var products = state.wishlistProducts!;
            if (products.isEmpty) {
              return const Column(
                children: [
                  SizedBox(height: 200),
                  Center(child: Text('No products added to wishlist!')),
                ],
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 210,
              ),
              itemBuilder: (context, index) {
                var product = products[index];
                return ProductItem(product: product);
              },
            );
          })
        ],
      ),
    );
  }
}
