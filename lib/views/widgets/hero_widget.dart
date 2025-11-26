import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
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
          child: Image.asset("assets/images/img.jpeg"),
        ),
      ),
    );
  }
}
