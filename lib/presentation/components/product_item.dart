import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/domain/use-case/user/check_if_wishlisted.dart';
import 'package:e_comm_app/presentation/screens/product_details/product_details_screen.dart';
import 'package:e_comm_app/utils/common_colors.dart';
import 'package:e_comm_app/utils/locator.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    this.isWishListed = true,
  });
  final ProductModel product;
  final bool isWishListed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var isWishListed = await locator<CheckIfWishlisted>().call(product);
        if (context.mounted) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(
                        product: product,
                        isWishListed: isWishListed,
                      )));
        }
      },
      child: Container(
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
                  product.imageUrl,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(product.name),
            const SizedBox(height: 8),
            Text(
              "Rs.${product.price}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
