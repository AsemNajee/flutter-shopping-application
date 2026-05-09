import 'package:flutter/material.dart';
import 'package:self_built_market/data/model/product.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  void switchFavorite(Product product){
    if(isFavorite(product)){
      _favoriteProducts.remove(product);
    }else{
      _favoriteProducts.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favoriteProducts.contains(product);
  }
}