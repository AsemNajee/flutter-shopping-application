import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/data/model/cart_item.dart';
import 'package:self_built_market/providers/cart_provider.dart';
import 'package:self_built_market/widgets/cart_counter.dart';

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
      body: productsInCart.isEmpty
          ? Center(child: Text("No products in cart"))
          : _cartGridBuilder(provider, productsInCart, deleteFromCart),
    );
  }

  Widget _cartGridBuilder(
    CartProvider provider,
    List<CartItem> productsInCart,
    void Function(CartItem cartItem) deleteFromCart,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.cartProducts.length,
              itemBuilder: (ctx, i) {
                return _cartItemBuilder(
                  cartItem: productsInCart.elementAt(i),
                  deleteProduct: deleteFromCart,
                  cartProvider: provider,
                );
              },
            ),
          ),
          Container(
            padding: .only(top: 8, bottom: 100, left: 16, right: 16),
            child: Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                Text(
                  "\$${provider.totalPriceWithDiscount}",
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
                SizedBox(width: 10),
                Text(
                  "\$${provider.totalPriceWithoutDiscount}",
                  style: TextStyle(
                    decoration: .lineThrough,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                // Expanded(child: Container()),
                ElevatedButton.icon(
                  label: Text("Buy Now"),
                  onPressed: () {},
                  icon: Icon(Icons.shopping_bag_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartItemBuilder({
    required CartItem cartItem,
    required Function(CartItem) deleteProduct,
    required CartProvider cartProvider,
  }) {
    return Container(
      padding: .all(8),
      margin: .only(bottom: 8),
      width: .infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .all(.circular(16)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: .all(4),
                width: 110,
                height: 110,
                child: ClipRRect(
                  borderRadius: .all(.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: cartItem.product.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: .all(8),
                  alignment: .centerLeft,
                  // height: 110,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        cartItem.product.title,
                        style: TextStyle(fontWeight: .bold, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Quantity: ${cartItem.count}",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "\$${cartItem.product.priceWithDiscount}",
                        style: TextStyle(
                          fontWeight: .bold,
                          fontSize: 16,
                          letterSpacing: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: .all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(100),
                  borderRadius: .all(.circular(16)),
                ),
                child: IconButton(
                  onPressed: () {
                    deleteProduct(cartItem);
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.grey[200],
            height: 1,
            margin: .only(top: 16, bottom: 16),
          ),
          Row(
            children: [
              SizedBox(height: 10),
              Text("Total: ", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10),
              Text(
                "\$${cartItem.totalPrice}",
                style: TextStyle(
                  fontWeight: .bold,
                  fontSize: 16,
                  letterSpacing: 2.5,
                ),
              ),
              Expanded(child: Container()),
              CartCounter(
                cartProvider: cartProvider,
                product: cartItem.product,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
