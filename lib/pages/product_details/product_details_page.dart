import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/providers/cart_provider.dart';
import 'package:self_built_market/providers/favorite_provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = context.watch<FavoriteProvider>();
    CartProvider cartProvider = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [
          Icon(Icons.shopping_bag_outlined)
        ],
      ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            alignment: .center,
            color: Colors.grey[300],
            height: 300,
            child: Image.asset(product.image),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(product.title, style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "${product.price}\$",
                  style: TextStyle(
                    decoration: .lineThrough,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "${product.priceWithDiscount}\$",
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Container(
                padding: .all(16),
                margin: .all(16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: cartProvider.isInCart(productId: product.id) ? .all(Colors.grey.withAlpha(100)) : .all(Colors.green),
                    foregroundColor: .all(Colors.white),
                    alignment: .center,
                  ),
                  onPressed:  cartProvider.isInCart(productId: product.id) ? null : () {
                    cartProvider.addToCart(product: product);
                  },
                  child: Container(
                    padding: .all(16),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        Icon(Icons.shopify_rounded, size: 30),
                        SizedBox(width: 20),
                        Text("Add to cart", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  favoriteProvider.switchFavorite(product);
                },
                icon: Icon(
                  favoriteProvider.isFavorite(product)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: favoriteProvider.isFavorite(product)
                      ? Colors.green
                      : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
