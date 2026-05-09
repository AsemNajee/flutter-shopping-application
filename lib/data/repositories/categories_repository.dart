import 'package:self_built_market/data/model/category.dart';
import 'package:self_built_market/data/model/product.dart';

class CategoriesRepository {
  static final Category _c1 = Category(
    title: "Cars and Bikes",
    description: "motors rides free and less",
  );
  static final Category _c2 = Category(
    title: "Clothes",
    description: "modern and future",
  );
  static final Category _c3 = Category(title: "Books", description: "read and learn");
  static final Category _c4 = Category(title: "Kitchen", description: "eat best food");

  static List<Category> get getCategories => [_c1, _c2, _c3, _c4];

  static List<Product> get allProducts => [
    Product(
      title: "BMW",
      price: 10000,
      discount: 5,
      image: "assets/images/car.png",
      categoryId: _c1.id,
    ),
    Product(
      title: "Toyota",
      price: 10000,
      discount: 5,
      image: "assets/images/car.png",
      categoryId: _c1.id,
    ),
    Product(
      title: "Prado",
      price: 10000,
      discount: 5,
      image: "assets/images/car.png",
      categoryId: _c1.id,
    ),
    Product(
      title: "Fortuner",
      price: 10000,
      discount: 5,
      image: "assets/images/car.png",
      categoryId: _c1.id,
    ),
    Product(
      title: "Learn Java",
      price: 99.99,
      discount: 0,
      image: "assets/images/car.png",
      categoryId: _c3.id,
    ),
    Product(
      title: "Java Script vs Type Script",
      price: 19.99,
      discount: 0,
      image: "assets/images/car.png",
      categoryId: _c3.id,
    ),
    Product(
      title: "Learn Operating System",
      price: 99.9,
      discount: 0,
      image: "assets/images/car.png",
      categoryId: _c3.id,
    ),
  ];

  static List<Product> getProductsOfCategory(Category category) {
    return allProducts.where((p) => p.categoryId == category.id).toList();
  }
}
