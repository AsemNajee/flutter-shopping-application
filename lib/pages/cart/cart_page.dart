import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/data/model/cart_item.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/pages/home/widgets/product_card.dart';
import 'package:self_built_market/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider provider = context.watch<CartProvider>();
    List<CartItem> productsInCart = provider.cartProducts.values.toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: provider.cartProducts.length,
        itemBuilder: (ctx, i) {
          return Container(
            width: .infinity,
            color: Colors.grey[100],
            child: Column(
              children: [
                Text("${productsInCart.elementAt(i).count}"),
                ProductCard(product: productsInCart.elementAt(i).product),
              ],
            ),
          );
        },
      ),
    );
  }
}