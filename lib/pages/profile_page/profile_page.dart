import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            child: ElevatedButton(onPressed: () {}, child: Text("Logout")),
          ),
        ],
      ),
    );
  }
}
