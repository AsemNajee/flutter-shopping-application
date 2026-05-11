import 'package:self_built_market/data/model/category.dart';
import 'package:self_built_market/data/model/product.dart';

class CategoriesRepository {
  // الفئات
  static final Category _carsCategory = Category(
    title: "Cars and Bikes",
    description: "motors rides free and less",
  );
  static final Category _clothesCategory = Category(
    title: "Clothes",
    description: "modern and future",
  );
  static final Category _booksCategory = Category(
    title: "Books",
    description: "read and learn",
  );
  static final Category _kitchenCategory = Category(
    title: "Kitchen",
    description: "eat best food",
  );

  static final List<Category> _categories = [
    _carsCategory,
    _clothesCategory,
    _booksCategory,
    _kitchenCategory,
  ];

  static final List<Product> _products = [
    // منتجات السيارات والدراجاتs
    Product(
      title: "Mercedes S-Class 2024",
      price: 85000,
      discount: 10,
      image: "assets/images/cars/Mercedes S-Class 2024.png",
      categoryId: _carsCategory.id,
    ),
    Product(
      title: "Toyota Camry 2024",
      price: 35000,
      discount: 5,
      image: "assets/images/cars/Toyota Camry 2024.png",
      categoryId: _carsCategory.id,
    ),
    Product(
      title: "Harley Davidson Sportster",
      price: 12000,
      discount: 0,
      image: "assets/images/cars/Harley Davidson Sportster.png",
      categoryId: _carsCategory.id,
    ),
    // Product(
    //   title: "Honda Civic Type R",
    //   price: 45000,
    //   discount: 8,
    //   image: "assets/images/cars/Honda Civic Type R.png",
    //   categoryId: _carsCategory.id,
    // ),
    // Product(
    //   title: "Yamaha R1 Motorcycle",
    //   price: 18000,
    //   discount: 3,
    //   image: "assets/images/cars/Yamaha R1 Motorcycle.png",
    //   categoryId: _carsCategory.id,
    // ),
    // Product(
    //   title: "BMW X5",
    //   price: 65000,
    //   discount: 7,
    //   image: "assets/images/cars/BMW X5.png",
    //   categoryId: _carsCategory.id,
    // ),

    // منتجات الكتب
    Product(
      title: "Clean Code",
      price: 45.99,
      discount: 15,
      image: "assets/images/books/Clean Code.png",
      categoryId: _booksCategory.id,
    ),
    Product(
      title: "Design Patterns",
      price: 55.99,
      discount: 10,
      image: "assets/images/books/Design Patterns.png",
      categoryId: _booksCategory.id,
    ),
    Product(
      title: "The Pragmatic Programmer",
      price: 49.99,
      discount: 0,
      image: "assets/images/books/The Pragmatic Programmer.png",
      categoryId: _booksCategory.id,
    ),
    Product(
      title: "Introduction to Algorithms",
      price: 89.99,
      discount: 5,
      image: "assets/images/books/Introduction to Algorithms.png",
      categoryId: _booksCategory.id,
    ),
    Product(
      title: "Artificial Intelligence Basics",
      price: 39.99,
      discount: 20,
      image: "assets/images/books/Artificial Intelligence Basics.png",
      categoryId: _booksCategory.id,
    ),
    // Product(
    //   title: "Python for Data Science",
    //   price: 44.99,
    //   discount: 12,
    //   image: "assets/images/books/Python for Data Science.png",
    //   categoryId: _booksCategory.id,
    // ),
    // Product(
    //   title: "Head First Design Patterns",
    //   price: 59.99,
    //   discount: 0,
    //   image: "assets/images/books/Head First Design Patterns.png",
    //   categoryId: _booksCategory.id,
    // ),

    // منتجات الملابس
    Product(
      title: "Classic White T-Shirt",
      price: 24.99,
      discount: 0,
      image: "assets/images/clothes/Classic White T-Shirt.png",
      categoryId: _clothesCategory.id,
    ),
    Product(
      title: "Denim Jacket",
      price: 89.99,
      discount: 15,
      image: "assets/images/clothes/Denim Jacket.png",
      categoryId: _clothesCategory.id,
    ),
    Product(
      title: "Slim Fit Jeans",
      price: 59.99,
      discount: 10,
      image: "assets/images/clothes/Slim Fit Jeans.png",
      categoryId: _clothesCategory.id,
    ),
    Product(
      title: "Summer Dress",
      price: 45.99,
      discount: 20,
      image: "assets/images/clothes/Summer Dress.png",
      categoryId: _clothesCategory.id,
    ),
    Product(
      title: "Running Shoes",
      price: 129.99,
      discount: 25,
      image: "assets/images/clothes/Running Shoes.png",
      categoryId: _clothesCategory.id,
    ),
    // Product(
    //   title: "Leather Belt",
    //   price: 34.99,
    //   discount: 0,
    //   image: "assets/images/clothes/Leather Belt.png",
    //   categoryId: _clothesCategory.id,
    // ),
    Product(
      title: "Wool Sweater",
      price: 79.99,
      discount: 30,
      image: "assets/images/clothes/Wool Sweater.png",
      categoryId: _clothesCategory.id,
    ),
    Product(
      title: "Cotton Socks Pack",
      price: 14.99,
      discount: 5,
      image: "assets/images/clothes/Cotton Socks Pack.png",
      categoryId: _clothesCategory.id,
    ),

    // منتجات المطبخ
    Product(
      title: "Chef's Knife Set",
      price: 199.99,
      discount: 10,
      image: "assets/images/kitchen/Chef's Knife Set.png",
      categoryId: _kitchenCategory.id,
    ),
    Product(
      title: "Non-Stick Pan Set",
      price: 89.99,
      discount: 15,
      image: "assets/images/kitchen/Non-Stick Pan Set.png",
      categoryId: _kitchenCategory.id,
    ),
    Product(
      title: "Electric Kettle",
      price: 39.99,
      discount: 0,
      image: "assets/images/kitchen/Electric Kettle.png",
      categoryId: _kitchenCategory.id,
    ),
    Product(
      title: "Blender Pro 2000",
      price: 149.99,
      discount: 20,
      image: "assets/images/kitchen/Blender Pro 2000.png",
      categoryId: _kitchenCategory.id,
    ),
    Product(
      title: "Coffee Maker Deluxe",
      price: 249.99,
      discount: 25,
      image: "assets/images/kitchen/Coffee Maker Deluxe.png",
      categoryId: _kitchenCategory.id,
    ),
    Product(
      title: "Cutting Board Set",
      price: 29.99,
      discount: 0,
      image: "assets/images/kitchen/Cutting Board Set.png",
      categoryId: _kitchenCategory.id,
    ),
    // Product(
    //   title: "Food Storage Containers",
    //   price: 34.99,
    //   discount: 10,
    //   image: "assets/images/kitchen/Food Storage Containers.png",
    //   categoryId: _kitchenCategory.id,
    // ),
    // Product(
    //   title: "Toaster Oven",
    //   price: 79.99,
    //   discount: 5,
    //   image: "assets/images/kitchen/Toaster Oven.png",
    //   categoryId: _kitchenCategory.id,
    // ),
  ];


  static List<Product> get allProducts => _products;

  static List<Category> get getCategories => _categories;

  static List<Product> getProductsOfCategory(Category category) {
    return allProducts.where((p) => p.categoryId == category.id).toList();
  }
}
