import 'package:self_built_market/data/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesRepositoryHttp {
  static final String _baseUrl = 'https://dummyjson.com/products';
  static List<String>? _categoriesCache;
  static Map<String, List<Product>>? _categoriesWithProductsCache;

  static List<Product>? _allData;
  static Map<String, List<Product>>? _sliceOfProductsCache;

  static Future<List<Product>?> _fetchData() async {
    if (_allData == null) {
      final response = await http.get(Uri.parse("$_baseUrl"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<Product> products = List<Product>.from(
          data['products'].map((p) => Product.fromJson(p))
        );
        _allData = products;
      }
    }
    return _allData;
  }

  static Future<List<Product>> fetchProductsByCategory(String category) async {
    if (_categoriesWithProductsCache != null &&
        _categoriesWithProductsCache!.containsKey(category)) {
      return _categoriesWithProductsCache![category]!;
    }
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/category/$category'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<Product> products = List<Product>.from(
          data['products'].map((product) => Product.fromJson(product)),
        );
        _categoriesWithProductsCache?[category] = products;
        return products;
      } else {
        throw Exception('Failed to load products for category $category');
      }
    } catch (e) {
      throw Exception('Failed to load products for category $category: $e');
    }
  }

  // filter categories with products with 10 products for each category
  static Future<Map<String, List<Product>>> fetchCategoriesWithSliceOfProducts() async {
    // if(_sliceOfProductsCache != null){
    //   return _sliceOfProductsCache!;
    // }

    Map<String, List<Product>> filteredCategoriesWithProducts = {};
    (await _fetchData())?.forEach((product) {
      if(!filteredCategoriesWithProducts.containsKey(product.category)){
        filteredCategoriesWithProducts[product.category] = [];
      }
      filteredCategoriesWithProducts[product.category]?.add(product);
    });
    _sliceOfProductsCache = filteredCategoriesWithProducts;
    return filteredCategoriesWithProducts;
  }
}
