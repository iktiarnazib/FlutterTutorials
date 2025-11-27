import 'package:flutter/material.dart';
import 'package:news/data/notifiers.dart';
import 'welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.0,
            child: ListTile(
              tileColor: Colors.pink,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomePage();
                    },
                  ),
                );
              },
              title: Text("Log Out", style: TextStyle(fontSize: 19.0)),
            ),
          ),
        ],
      ),
    );
  }
}
