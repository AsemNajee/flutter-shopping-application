import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/data/model/cart_item.dart';
import 'package:self_built_market/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider provider = context.watch<CartProvider>();
    List<CartItem> productsInCart = provider.cartProducts.values.toList();

    void deleteFromCart(CartItem cartItem) {
      provider.removeCart(productId: cartItem.product.id);
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.cartProducts.length,
              itemBuilder: (ctx, i) {
                return cartItemBuilder(
                  cartItem: productsInCart.elementAt(i),
                  deleteProduct: deleteFromCart,
                );
              },
            ),
          ),
          Container(
            padding: .all(8),
            child: Row(
              children: [
                Text(
                  "${provider.totalPriceWithDiscount}\$",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(width: 10,),
                Text(
                  "${provider.totalPriceWithoutDiscount}\$",
                  style: TextStyle(decoration: .lineThrough),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cartItemBuilder({
    required CartItem cartItem,
    required Function(CartItem) deleteProduct,
  }) {
    return Container(
      padding: .all(4),
      width: .infinity,
      margin: .all(4),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: .all(.circular(8)),
      ),
      child: Row(
        children: [
          Container(
            margin: .all(4),
            width: 90,
            height: 150,
            child: ClipRRect(
              borderRadius: .all(.circular(8)),
              child: Image.asset(cartItem.product.image, fit: .cover),
            ),
          ),
          Expanded(
            child: Container(
              alignment: .centerLeft,
              height: 110,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(cartItem.product.title),
                  SizedBox(height: 20),
                  Text(
                    "${cartItem.totalPriceWithoutDiscount}\$",
                    style: TextStyle(decoration: .lineThrough),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${cartItem.totalPrice}\$",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(100),
              borderRadius: .all(.circular(16)),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    deleteProduct(cartItem);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
