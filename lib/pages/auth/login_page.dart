import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<UserCredential?> signInWithGoogle() async {
    return null;
    // Trigger the authentication flow
    // final GoogleSignInAccount? googleUser = await GoogleSignIn.signIn();

    // // Obtain the auth details from the request
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    // // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
