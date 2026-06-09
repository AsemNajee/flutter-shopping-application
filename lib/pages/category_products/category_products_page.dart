import 'package:flutter/material.dart';
import 'package:self_built_market/data/repositories/categories_repository.dart';
import 'package:self_built_market/data/model/category.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/widgets/products_grid_view.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    List<Product> products = CategoriesRepository.getProductsOfCategory(category);
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ProductsGridView(products: products),
    );
  }
}
