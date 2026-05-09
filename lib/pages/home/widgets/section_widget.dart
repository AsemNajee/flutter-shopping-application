import 'package:flutter/material.dart';
import 'package:self_built_market/data/category.dart';
import 'package:self_built_market/data/product.dart';
import 'package:self_built_market/pages/category_products/category_products_page.dart';
import 'package:self_built_market/pages/home/widgets/product_card.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    final List<Product> products = category.products;
    return Container(
      padding: .all(8),
      color: Colors.amber,
      height: 350,
      margin: .only(bottom: 8),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Section title",
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                    Text("Section description"),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (c) => CategoryProductsPage(category: category),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: .horizontal,
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
