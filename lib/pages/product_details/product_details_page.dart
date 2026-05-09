import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/providers/favorite_provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    FavoriteProvider provider = context.watch<FavoriteProvider>();
    return Scaffold(
      appBar: AppBar(),
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
                  "${product.price - (product.price * (product.discount / 100))}\$",
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
                    backgroundColor: .all(Colors.green),
                    foregroundColor: .all(Colors.white),
                    alignment: .center,
                  ),
                  onPressed: () {},
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
                  provider.switchFavorite(product);
                },
                icon: Icon(
                  provider.isFavorite(product)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: provider.isFavorite(product)
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
