import 'package:self_built_market/data/category.dart';
import 'package:self_built_market/data/product.dart';

class CategoriesRepository {
  get categoriesWithProducts => [
    Category("Cars and Bikes", "motors rides free and less", 1, allProducts),
    Category("Cars and Bikes", "motors rides free and less", 1, allProducts),
    Category("Cars and Bikes", "motors rides free and less", 1, allProducts),
    Category("Cars and Bikes", "motors rides free and less", 1, allProducts),
  ];

  get allProducts => [
    Product("Car", 10000, 5, "assets/images/car.png"),
    Product("Car", 10000, 5, "assets/images/car.png"),
    Product("Car", 10000, 5, "assets/images/car.png"),
    Product("Car", 10000, 5, "assets/images/car.png"),
    Product("Car", 10000, 5, "assets/images/car.png"),
  ];
}