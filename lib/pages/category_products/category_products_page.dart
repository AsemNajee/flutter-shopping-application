import 'package:flutter/material.dart';
import 'package:self_built_market/data/category.dart';
import 'package:self_built_market/pages/home/widgets/product_card.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemCount: category.products.length,
        itemBuilder: (ctx, i) {
        return ProductCard(product: category.products[i]);
      }),
    );
  }
}
