import 'package:flutter/material.dart';
import 'package:self_built_market/data/repositories/categories_repository.dart';
import 'package:self_built_market/data/model/category.dart';
import 'package:self_built_market/pages/cart/cart_page.dart';
import 'package:self_built_market/pages/categories/categories_page.dart';
import 'package:self_built_market/pages/favorite/favorite_page.dart';
import 'package:self_built_market/pages/home/widgets/section_widget.dart';
import 'package:self_built_market/pages/profile_page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTap = 0;
  PageController controller = PageController();

  List<Category> get categories => CategoriesRepository.getCategories;

  void changeTap(int tap) {
    setState(() {
      _currentTap = tap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
          CategoriesPage(categories: categories),
          FavoritePage(),
          CartPage(),
          ProfilePage(),
        ],
      ),

      extendBody: true,
      bottomNavigationBar: Container(
        color: Colors.transparent,
        margin: .only(bottom: 16, left: 25, right: 25, top: 4),
        child: Container(
          padding: .only(bottom: 8, left: 8, right: 8, top: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: .all(.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: .all(.circular(50)),
            child: BottomNavigationBar(
              currentIndex: _currentTap,
              onTap: (i) {
                controller.animateToPage(
                  i,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                );
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.maps_home_work_outlined),
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
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
