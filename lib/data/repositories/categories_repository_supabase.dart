import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/data/repositories/db_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoriesRepositorySupabase implements DbRepository {
  static Map<String, List<Product>>? _categoriesWithProductsCache;

  static List<Product>? _allData;

  Future<List<Product>?> _fetchData() async {
    if (_allData == null) {
      final response = await Supabase.instance.client.from("products").select();
      if (response.isNotEmpty) {
        List<Product> products = List<Product>.from(
          response.map((p) => Product.fromJson(p)),
        );
        _allData = products;
      }
    }
    return _allData;
  }

  List<Product> fetchProductsByCategory(String category) {
    if (_categoriesWithProductsCache != null &&
        _categoriesWithProductsCache!.containsKey(category)) {
      return _categoriesWithProductsCache![category]!;
    }
    return [];
  }

  // filter categories with products with 10 products for each category
  Future<Map<String, List<Product>>>
  fetchCategoriesWithSliceOfProducts() async {
    if (_categoriesWithProductsCache != null) {
      return _categoriesWithProductsCache!;
    }

    Map<String, List<Product>> filteredCategoriesWithProducts = {};
    (await _fetchData())?.forEach((product) {
      if (!filteredCategoriesWithProducts.containsKey(product.category)) {
        filteredCategoriesWithProducts[product.category] = [];
      }
      filteredCategoriesWithProducts[product.category]?.add(product);
    });
    _categoriesWithProductsCache = filteredCategoriesWithProducts;
    return filteredCategoriesWithProducts;
  }
}
