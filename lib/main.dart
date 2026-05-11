import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/pages/home/home_page.dart';
import 'package:self_built_market/providers/cart_provider.dart';
import 'package:self_built_market/providers/favorite_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: .light,
        ),
      ),
      themeMode: .dark,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
