import 'package:flutter/material.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/data/repositories/categories_repository_http.dart';
import 'package:self_built_market/widgets/products_grid_view.dart';

class CategoryProductsPage extends StatefulWidget {
  const CategoryProductsPage({super.key, required this.category});
  final String category;

  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  List<Product> products = [];

  void fetchData() async {
    products = await CategoriesRepositoryHttp.fetchProductsByCategory(
      widget.category,
    );
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: ProductsGridView(products: products),
    );
  }
}
