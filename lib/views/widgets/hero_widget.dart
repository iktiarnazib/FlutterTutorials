import 'package:flutter/material.dart';
import 'package:news/data/constants.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: "Hero 1",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.yellow,
                    behavior: SnackBarBehavior.floating,
                    content: Text("Image cannot be clicked!"),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/new.jpeg",
                color: Colors.amber,
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 100.0,
              letterSpacing: 60.0,
              color: Colors.blue[300],
            ),
          ),
        ),
      ],
    );
  }
}
