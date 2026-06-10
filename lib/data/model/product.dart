import 'dart:math';

import 'package:self_built_market/data/model/review.dart';

class Product {

// {
//       "id": 1,
//       "title": "Essence Mascara Lash Princess",
//       "description": "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
//       "category": "beauty",
//       "price": 9.99,
//       "discountPercentage": 10.48,
//       "rating": 2.56,
//       "stock": 99,
//       "tags": [
//         "beauty",
//         "mascara"
//       ],
//       "brand": "Essence",
//       "sku": "BEA-ESS-ESS-001",
//       "weight": 4,
//       "dimensions": {
//         "width": 15.14,
//         "height": 13.08,
//         "depth": 22.99
//       },
//       "warrantyInformation": "1 week warranty",
//       "shippingInformation": "Ships in 3-5 business days",
//       "availabilityStatus": "In Stock",
//       "reviews": [
//         {
//           "rating": 3,
//           "comment": "Would not recommend!",
//           "date": "2025-04-30T09:41:02.053Z",
//           "reviewerName": "Eleanor Collins",
//           "reviewerEmail": "eleanor.collins@x.dummyjson.com"
//         },
//         {
//           "rating": 4,
//           "comment": "Very satisfied!",
//           "date": "2025-04-30T09:41:02.053Z",
//           "reviewerName": "Lucas Gordon",
//           "reviewerEmail": "lucas.gordon@x.dummyjson.com"
//         },
//         {
//           "rating": 5,
//           "comment": "Highly impressed!",
//           "date": "2025-04-30T09:41:02.053Z",
//           "reviewerName": "Eleanor Collins",
//           "reviewerEmail": "eleanor.collins@x.dummyjson.com"
//         }
//       ],
//       "returnPolicy": "No return policy",
//       "minimumOrderQuantity": 48,
//       "meta": {
//         "createdAt": "2025-04-30T09:41:02.053Z",
//         "updatedAt": "2025-04-30T09:41:02.053Z",
//         "barcode": "5784719087687",
//         "qrCode": "https://cdn.dummyjson.com/public/qr-code.png"
//       },
//       "images": [
//         "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
//       ],
//       "thumbnail": "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"
//     },

  static int autoIncrement = 1;
  final String title;
  final double price;
  final double discount;
  final String image;
  final int id;
  final int categoryId;
  final String category;
  final String? description;
  final String? brand;
  final String? sku;
  final double? weight;
  final Map<String, double>? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Map<String, dynamic>? meta;
  final List<String>? tags;
  final List<String>? images;

  Product({
    required this.title,
    required this.price,
    this.discount = 0,
    required this.image,
    required this.categoryId,
    required this.category,
    this.description,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.tags,
    this.images,
  }) : id = autoIncrement++;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'].toDouble(),
      discount: json['discountPercentage'].toDouble(),
      image: json['thumbnail'] ?? '',
      category: json['category'] ?? '',
      categoryId: Random().nextInt(100000) ,
      // categoryId: json['categoryId'] ?? '',
      description: json['description'] ?? '',
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      // weight: json['weight'].toDouble() ?? 66,
      // weight: json['weight'].toDouble() ?? 66,
      // dimensions: json['dimensions'] ?? '',
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      // reviews: List.from(json['reviews'] ?? []).map((review) => Review.fromJson(review)).toList(),
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? '',
      // meta: json['meta'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      images: List<String>.from(json['images'] ?? []),
    );
  }

  double get priceWithDiscount => (price - (price * (discount / 100))).roundToDouble();
}
