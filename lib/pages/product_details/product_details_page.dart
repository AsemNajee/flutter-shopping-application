import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/providers/cart_provider.dart';
import 'package:self_built_market/providers/favorite_provider.dart';
import 'package:self_built_market/widgets/cart_counter.dart';

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
          InkWell(
            onTap: () {
              favoriteProvider.switchFavorite(product);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: .all(.circular(50)),
              ),
              padding: .all(8),
              margin: .all(8),
              child: Icon(
                favoriteProvider.isFavorite(product)
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: favoriteProvider.isFavorite(product)
                    ? Colors.green[800]
                    : Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: .only(
              bottomLeft: .circular(25),
              bottomRight: .circular(25),
            ),
            child: Container(
              color: Colors.lightBlue[50],
              child: Column(
                children: [
                  Container(
                    alignment: .center,
                    padding: .all(8),
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: .only(
                        bottomLeft: .circular(25),
                        bottomRight: .circular(25),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: .all(.circular(8)),
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Container(
                    width: .infinity,
                    padding: const EdgeInsets.all(16.0),
                    height: 80,
                    child: Center(
                      child: Text(
                        product.title,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                    fontSize: 18,
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  "${product.priceWithDiscount}\$",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 18,
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Container(
                padding: .all(8),
                margin: .all(8),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        cartProvider.isInCart(productId: product.id)
                        ? .all(Colors.grey.withAlpha(100))
                        : .all(Colors.lightBlue),
                    foregroundColor: .all(Colors.white),
                    alignment: .center,
                  ),
                  onPressed: cartProvider.isInCart(productId: product.id)
                      ? null
                      : () {
                          cartProvider.addToCart(product: product);
                        },
                  label: Text("Add to cart", style: TextStyle(fontSize: 16, height: 3)),
                  icon: Icon(Icons.shopify_rounded, size: 25),
                ),
              ),
              cartProvider.isInCart(productId: product.id)
                  ? CartCounter(cartProvider: cartProvider, product: product)
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
