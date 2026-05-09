import 'package:self_built_market/data/model/product.dart';

class CartItem {
  int count;
  final Product product;

  CartItem({this.count = 1, required this.product});

  void increas({int count = 1}){
    this.count += count;
  }
}