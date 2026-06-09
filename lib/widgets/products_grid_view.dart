import 'package:flutter/material.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/pages/home/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (ctx, i) {
        return ProductCard(product: products[i]);
      }),
    );
  }
}
