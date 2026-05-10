class Product {
  static int autoIncrement = 1;
  final String title;
  final double price;
  final double discount;
  final String image;
  final int id;
  final int categoryId;

  Product({
    required this.title,
    required this.price,
    this.discount = 0,
    required this.image,
    required this.categoryId
  }) : id = autoIncrement++;

  double get priceWithDiscount => (price - (price * (discount / 100))).roundToDouble();
}
