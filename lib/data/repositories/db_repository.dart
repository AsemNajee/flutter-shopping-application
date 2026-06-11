import 'package:self_built_market/data/model/product.dart';

class DbRepository {
  List<Product> fetchProductsByCategory(String category) {
    throw Exception();
  }

  Future<Map<String, List<Product>>>
  fetchCategoriesWithSliceOfProducts() async {
    throw Exception();
  }
}
