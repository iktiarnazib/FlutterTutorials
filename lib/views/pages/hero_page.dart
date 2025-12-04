import 'package:flutter/material.dart';
import 'package:news/views/widgets/hero_widget.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [HeroWidget(title: 'Hero Page')]),
    );
  }
}
