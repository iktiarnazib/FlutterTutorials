import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Hero 1",
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20.0),
        child: Image.asset("assets/images/img.jpeg"),
      ),
    );
  }
}
