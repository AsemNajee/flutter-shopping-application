import 'package:flutter/material.dart';
import 'package:self_built_market/data/model/category.dart';
import 'package:self_built_market/pages/category_products/category_products_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildCategoriesGrid(categories));
  }

  Widget buildCategoriesGrid(List<Category> categories) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 280,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (c) => CategoryProductsPage(category: categories[i]),
                ),
              );
            },
            child: Container(
              alignment: .center,
              padding: .all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .all(.circular(8)),
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey[200]!)],
              ),
              // height: 150,
              width: .infinity,
              child: Text(
                categories[i].title,
                style: TextStyle(fontWeight: .bold, fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
