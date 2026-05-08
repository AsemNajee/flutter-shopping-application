import 'package:self_built_market/data/product.dart';

class Category {
  final String title;
  final String description;
  final int id;
  final List<Product> products;

  Category(this.title, this.description, this.id, this.products);
}