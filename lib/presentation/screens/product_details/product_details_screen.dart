import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/domain/use-case/user/add_to_wishlist.dart';
import 'package:e_comm_app/presentation/components/common_button.dart';
import 'package:e_comm_app/utils/locator.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CommonButton(callback: () {}, title: 'Add to Cart'),
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              await locator<AddToWishlist>().call(product).then((_) {
                const snackBar = SnackBar(
                  content: Text('Added to wishlist'),
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            },
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(width: 16)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(product.imageUrl),
              ),
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Rs.${product.price}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                product.description,
                maxLines: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
