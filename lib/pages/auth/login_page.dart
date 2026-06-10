import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: .infinity,
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Login With Google")),
          ],
        ),
      ),
    );
  }
}
