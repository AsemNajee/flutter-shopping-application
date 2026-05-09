import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/pages/home/widgets/product_card.dart';
import 'package:self_built_market/providers/favorite_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteProvider provider = context.watch<FavoriteProvider>();

    return Scaffold(
      body: ListView.builder(
        itemCount: provider.favoriteProducts.length,
        itemBuilder: (ctx, i) {
          return ProductCard(product: provider.favoriteProducts[i]);
        },
      ),
    );
  }
}
