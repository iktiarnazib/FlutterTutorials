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
          OutlinedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog.adaptive(
                    title: Text(
                      "This is alert Dialog",
                      style: TextStyle(color: Colors.red),
                    ),
                    content: Text("You shouldn't press the alert dialog!"),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Container(
                            height: 40.0,
                            child: Center(child: Text("Close")),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("Alert Dialog"),
          ),
        ],
      ),
    );
  }
}
