import 'package:flutter/material.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/pages/category_products/category_products_page.dart';
import 'package:self_built_market/pages/home/widgets/product_card.dart';

class SectionWidget extends StatefulWidget {
  const SectionWidget({super.key, required this.category, required this.products});
  final String category;
  final List<Product> products;

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  // List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(8),
      // color: Colors.amber,
      // height: 350,
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
                      widget.category,
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                    Text(widget.category),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (c) =>
                          CategoryProductsPage(category: widget.category),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: .horizontal,
              itemCount: widget.products.length,
              itemExtent: 250,
              itemBuilder: (ctx, index) {
                return ProductCard(product: widget.products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
