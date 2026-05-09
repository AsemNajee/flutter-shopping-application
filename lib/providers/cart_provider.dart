import 'package:flutter/widgets.dart';
import 'package:self_built_market/data/model/cart_item.dart';
import 'package:self_built_market/data/model/product.dart';

class CartProvider extends ChangeNotifier {
  // final List<CartItem> _cart = [];
  final Map<int, CartItem> _carts = {};

  double get totalPriceWithoutDiscount {
    double totalPrice = 0;
    _carts.forEach((k, v) => totalPrice += v.product.price);
    return totalPrice;
  }

  double get totalPriceWithDiscount {
    double totalPrice = 0;
    _carts.forEach(
      (k, v) => totalPrice +=
          (v.product.price - (v.product.price * (v.product.discount / 100))),
    );
    return totalPrice;
  }

  void addToCart({required Product product, int count = 1}) {
    if (_carts.containsKey(product.id)) {
      _carts[product.id]?.count += count;
    } else {
      _carts[product.id] = CartItem(product: product, count: count);
    }
    notifyListeners();
  }

  Map<int, CartItem> get cartProducts => _carts;
}
