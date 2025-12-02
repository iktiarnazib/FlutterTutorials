import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/data/notifiers.dart';
import 'package:news/views/pages/login_page.dart';
import 'package:news/views/pages/register_page.dart';

import '../widget_tree.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lotties/Home.json"),
            FittedBox(
              child: Text(
                "Welcome to Flutter",
                style: TextStyle(
                  fontSize: 150.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FilledButton(
              onPressed: () {
                selectedIndexNotifier.value = 0;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ),
                );
              },
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
              child: Text("Register"),
            ),
            OutlinedButton(
              onPressed: () {
                selectedIndexNotifier.value = 0;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
