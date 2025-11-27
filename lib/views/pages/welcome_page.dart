import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/data/notifiers.dart';

import '../widget_tree.dart';
import '../widgets/hero_widget.dart';

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
                      return WidgetTree();
                    },
                  ),
                );
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
