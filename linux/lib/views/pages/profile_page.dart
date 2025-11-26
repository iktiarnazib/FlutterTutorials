import 'package:flutter/material.dart';

import 'home_page.dart';
import 'settings_page.dart';
import 'welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
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
            title: Text("Log Out", style: TextStyle(fontSize: 20.0)),
          ),
        ],
      ),
    );
  }
}
