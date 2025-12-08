import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title, this.onPage});

  final String title;
  final Widget? onPage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: "Hero 1",
          child: AspectRatio(
            aspectRatio: 1920 / 1080,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                onTap: onPage != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return onPage!;
                            },
                          ),
                        );
                      }
                    : null,
                child: Image.asset(
                  "assets/images/new.jpeg",
                  fit: BoxFit.cover,
                  color: Colors.amber,
                  colorBlendMode: BlendMode.darken,
                ),
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
