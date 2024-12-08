import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/domain/use-case/user/add_to_wishlist.dart';
import 'package:e_comm_app/domain/use-case/user/remove_wishlist.dart';
import 'package:e_comm_app/presentation/components/common_button.dart';
import 'package:e_comm_app/utils/locator.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
    this.isWishListed = true,
  });
  final ProductModel product;
  final bool isWishListed;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isWishListed = false;

  @override
  void initState() {
    isWishListed = widget.isWishListed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CommonButton(
            callback: () {
              const snackBar = SnackBar(
                content: Text('Not Implemented'),
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            title: 'Add to Cart'),
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              if (!isWishListed) {
                await locator<AddToWishlist>().call(widget.product).then((_) {
                  setState(() {
                    isWishListed = true;
                  });
                  const snackBar = SnackBar(
                    content: Text('Added to wishlist'),
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              } else {
                await locator<RemoveWishlist>().call(widget.product).then((_) {
                  setState(() {
                    isWishListed = false;
                  });
                  const snackBar = SnackBar(
                    content: Text('Removed from wishlist'),
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              }
            },
            child: !isWishListed
                ? const Icon(Icons.favorite_border_rounded)
                : const Icon(Icons.favorite),
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
                child: Image.network(widget.product.imageUrl),
              ),
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Rs.${widget.product.price}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.product.description,
                maxLines: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
