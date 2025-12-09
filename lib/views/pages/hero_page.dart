import 'package:flutter/material.dart';
import 'package:news/views/pages/login_page.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [HeroWidget(title: 'Hero Page')]),
      ),
    );
  }
}
