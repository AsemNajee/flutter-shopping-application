import 'dart:math';

import 'package:flutter/material.dart';
import 'package:self_built_market/data/model/product.dart';
import 'package:self_built_market/pages/product_details/product_details_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: .all(.circular(8)),
          color: Colors.white,
        ),
        margin: .fromLTRB(8, 8, 8, 8),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: .all(4),
                width: .infinity,
                child: ClipRRect(
                  borderRadius: .circular(8),
                  child: Image.asset(product.image, fit: .cover),
                ),
              ),
            ),
            Container(
              padding: .all(6),
              child: Column(
                // mainAxisAlignment: .spaceEvenly,
                // mainAxisSize: .max,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: TextStyle(fontWeight: .bold, fontSize: 14),
                          overflow: .ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 8,
                          direction: .horizontal,
                          children: [
                            Text(
                              "${product.price}\$",
                              style: TextStyle(decoration: .lineThrough),
                            ),
                            Text(
                              "${product.priceWithDiscount}\$",
                              style: TextStyle(fontWeight: .bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
