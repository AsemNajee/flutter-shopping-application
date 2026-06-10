import 'package:flutter/material.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/pages/home/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.7
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          return ProductCard(product: products[i]);
        },
    );
  }
}
