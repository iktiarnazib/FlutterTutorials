import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/data/notifiers.dart';
import 'package:news/views/pages/login_page.dart';
import 'package:news/views/pages/onboarding_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OnboardingPage();
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text("Get Started"),
                ),
                OutlinedButton(
                  onPressed: () {
                    selectedIndexNotifier.value = 0;
                    Navigator.push(
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
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
