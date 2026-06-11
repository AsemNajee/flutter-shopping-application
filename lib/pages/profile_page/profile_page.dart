import 'package:flutter/material.dart';
import 'package:self_built_market/main.dart';
import 'package:self_built_market/pages/auth/login_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _loading = false;

  void _logout() async {
    setState(() {
      _loading = true;
    });
    await supabase.auth.signOut();
    if(mounted){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: .only(top: 16, bottom: 16),
      child: Column(
        mainAxisSize: .max,
        children: [
          SizedBox(height: 100),
          Container(
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: .all(.circular(50)),
              child: Image.asset("assets/images/profile.png"),
            ),
          ),

          SizedBox(height: 8),

          Container(
            padding: .all(8),
            child: Column(
              children: [
                Text(
                  "Asem Najee",
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),

                Container(
                  padding: .all(8),
                  child: Text(
                    "asem.a.najee@gmail.com",
                    textAlign: .center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),

                // Container(
                //   padding: .all(16),
                //   child: Row(
                //     mainAxisAlignment: .spaceEvenly,
                //     children: [
                //       Icon(Icons.telegram),
                //       Icon(Icons.telegram),
                //       Icon(Icons.telegram),
                //       Icon(Icons.telegram),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: .only(bottom: 200),
            child: _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      _logout();
                    },
                    child: Text("Logout"),
                  ),
          ),
        ],
      ),
    );
  }
}
