import 'package:flutter/material.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/providers/cart_provider.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    super.key,
    required this.cartProvider,
    required this.product,
  });

  final CartProvider cartProvider;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: .all(.circular(16)),
      ),
      child: Row(
        crossAxisAlignment: .center,
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(Icons.add),
            ),
            onTap: (){
              cartProvider.addToCart(product: product, count: 1);
            },
          ),
          Container(
            width: 5,
            height: .infinity,
            color: Colors.grey[100],
            // margin: .only(left: 8, right: 8),
          ),
          Padding(
            padding: .only(left: 8, right: 8),
            child: Text(
              "${cartProvider.cartProducts[product.id]?.count ?? 0}",
              style: TextStyle(fontWeight: .bold, fontSize: 16),
            ),
          ),
          Container(
            width: 5,
            height: .infinity,
            color: Colors.grey[100],
            // margin: .only(left: 8, right: 8),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(Icons.remove),
            ),
            onTap: () {
              cartProvider.addToCart(product: product, count: -1);
            },
          ),
        ],
      ),
    );
  }
}
