import 'package:flutter/material.dart';

import '../widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          HeroWidget(),
          SizedBox(height: 20.0),
          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.teal,
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    "The Snackbar has been pressed",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            child: Text("Show Snackbar"),
          ),
        ],
      ),
    );
  }
}
