
@Deprecated("this class is deprecated and will be removed in future versions")
class Category {
  static int autoIncrement = 1;
  final String title;
  final String description;
  final int id;
  // final List<Product> products;

  Category({required this.title, required this.description}): id = autoIncrement++;
}