import 'package:flutter/material.dart';
import 'package:news/data/constants.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: KTextStyle.titleTextSyle),
              Text(widget.description, style: KTextStyle.descriptionTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
