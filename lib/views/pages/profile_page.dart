import 'package:flutter/material.dart';
import 'welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height: 5.0),
            Text(
              'Name: Iktiar',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 60.0,
              child: ListTile(
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
      ),
    );
  }
}
