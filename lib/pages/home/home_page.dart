import 'package:flutter/material.dart';
import 'package:self_built_market/data/categories_repository.dart';
import 'package:self_built_market/data/category.dart';
import 'package:self_built_market/data/product.dart';
import 'package:self_built_market/pages/categories/categories_page.dart';
import 'package:self_built_market/pages/favorite/favorite_page.dart';
import 'package:self_built_market/pages/home/widgets/section_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTap = 0;
  PageController controller = PageController();

  List<Category> get categories => CategoriesRepository.categoriesWithProducts;

  void changeTap(int tap) {
    setState(() {
      _currentTap = tap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Market Project")),

      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            _currentTap = index;
          });
        },
        children: [
          ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) =>
                SectionWidget(category: categories[index]),
          ),
          CategoriesPage(categories: categories,),
          FavoritePage(),
          Container(child: Text("Cart Page")),
          Container(child: Text("Page Number 4")),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black,
        currentIndex: _currentTap,
        elevation: 20,
        onTap: (i) {
          controller.animateToPage(
            i,
            duration: Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_home_work_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Profile"),
        ],
      ),
    );
  }
}
