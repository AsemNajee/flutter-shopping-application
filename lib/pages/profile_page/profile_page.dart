import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: .only(top: 16, bottom: 16),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: .all(.circular(50)),
              child: Image.asset("assets/images/profile.png"),
            ),
          ),

          Container(
            padding: .all(8),
            child: Column(
              children: [
                Text(
                  "Asem Najee",
                  style: TextStyle(fontSize: 18, fontWeight: .bold),
                ),
                
                Container(
                  padding: .all(8),
                  child: Text(
                    "Software Engineer, Backend Developer & Project Manager & Data Analysis & Go To School Every Day",
                    textAlign: .center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                Container(
                  padding: .all(16),
                  child: Row(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      Icon(Icons.telegram),
                      Icon(Icons.telegram),
                      Icon(Icons.telegram),
                      Icon(Icons.telegram),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
