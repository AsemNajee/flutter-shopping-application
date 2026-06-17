import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/pages/auth/login_page.dart';
import 'package:self_built_market/pages/auth/sign_up_page.dart';
import 'package:self_built_market/pages/home/home_page.dart';
import 'package:self_built_market/pages/insert.dart';
import 'package:self_built_market/providers/cart_provider.dart';
import 'package:self_built_market/providers/favorite_provider.dart';
import 'package:self_built_market/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://kaamjczegbbqszwiojry.supabase.co',
    publishableKey: 'sb_publishable_zvMRP2Kg70luh-egTrsUig_FcnhGdy0',
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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

final supabase = Supabase.instance.client;

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: .light,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          elevation: 20,
        ),
        useMaterial3: true,
        colorScheme: MaterialTheme.lightScheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
          titleTextStyle: TextStyle(fontSize: 18, color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      // home: const HomePage(),
      // home: const Insert(),
      home: supabase.auth.currentSession == null ? LoginPage() : HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}
