import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_built_market/pages/home/home_page.dart';
import 'package:self_built_market/providers/cart_provider.dart';
import 'package:self_built_market/providers/favorite_provider.dart';
import 'package:self_built_market/theme.dart';

void main() async {
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
      home: const HomePage(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (ctx, snapshot) {
      //     if(snapshot.hasData && snapshot.data != null){
      //       return HomePage();
      //     }

      //     if(snapshot.connectionState == .waiting){
      //       return Scaffold(
      //         body: CircularProgressIndicator(),
      //       );
      //     }

      //     return LoginPage();
      //   },
      // ),
      debugShowCheckedModeBanner: false,
    );
  }
}
