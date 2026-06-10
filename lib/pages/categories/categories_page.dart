import 'package:flutter/material.dart';
import 'package:self_built_market/data/model/category.dart';
import 'package:self_built_market/data/repositories/categories_repository_http.dart';
import 'package:self_built_market/pages/category_products/category_products_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key, required this.categories});

  final List<String> categories;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildCategoriesGrid(widget.categories));
  }

  Widget buildCategoriesGrid(List<String> categories) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
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
              padding: .all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: .all(.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Expanded(
                    child: Container(
                      alignment: .center,
                      padding: .all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(50),
                        borderRadius: .only(topLeft: .circular(25), topRight: .circular(25), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                        boxShadow: [
                          // BoxShadow(blurRadius: 4, color: Colors.grey[200]!),
                        ],
                      ),
                      // height: 150,
                      width: .infinity,
                      child: Text(
                        categories[i],
                        style: TextStyle(fontWeight: .bold, fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${CategoriesRepositoryHttp.fetchProductsByCategory(categories[i]).length} Items", style: TextStyle(fontSize: 16, color: Colors.white),),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
