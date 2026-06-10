import 'package:self_built_market/data/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesRepositoryHttp {
  static final String _baseUrl = 'https://dummyjson.com/products';
  static Map<String, List<Product>>? _categoriesWithProductsCache;

  static List<Product>? _allData;
  // static Map<String, List<Product>>? _sliceOfProductsCache;

  static Future<List<Product>?> _fetchData() async {
    if (_allData == null) {
      final response = await http.get(Uri.parse("$_baseUrl?limit=200"));
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

  static List<Product> fetchProductsByCategory(String category) {
    if (_categoriesWithProductsCache != null &&
        _categoriesWithProductsCache!.containsKey(category)) {
      return _categoriesWithProductsCache![category]!;
    }
    return [];
  }

  // filter categories with products with 10 products for each category
  static Future<Map<String, List<Product>>> fetchCategoriesWithSliceOfProducts() async {
    if(_categoriesWithProductsCache != null){
      return _categoriesWithProductsCache!;
    }

    Map<String, List<Product>> filteredCategoriesWithProducts = {};
    (await _fetchData())?.forEach((product) {
      if(!filteredCategoriesWithProducts.containsKey(product.category)){
        filteredCategoriesWithProducts[product.category] = [];
      }
      filteredCategoriesWithProducts[product.category]?.add(product);
    });
    _categoriesWithProductsCache = filteredCategoriesWithProducts;
    return filteredCategoriesWithProducts;
  }
}
