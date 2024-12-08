import 'package:e_comm_app/presentation/bloc/product/product_bloc.dart';
import 'package:e_comm_app/presentation/bloc/product/product_state.dart';
import 'package:e_comm_app/presentation/components/screen_title.dart';
import 'package:e_comm_app/utils/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const ScreenTitle(title: 'Products'),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            var products = state.products!;
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
                var item = products[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Image.network(
                            item.imageUrl,
                            height: 80,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(item.name),
                      const SizedBox(height: 8),
                      Text(
                        "Rs.${item.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          })
        ],
      ),
    );
  }
}
