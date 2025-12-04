import 'package:flutter/material.dart';
import 'package:news/data/constants.dart';
import 'package:news/views/pages/hero_page.dart';
import 'package:news/views/widgets/card_widget.dart';
import '../widgets/hero_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> title = [
    KTexts.Welcome,
    KTexts.HowTo,
    KTexts.Todo,
    KTexts.Progress,
    KTexts.now,
  ];

  List<String> Description = [
    KTextDes.WelcomeDes,
    KTextDes.HowToDes,
    KTextDes.TodoDes,
    KTextDes.ProgressDes,
    KTextDes.nowDes,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeroWidget(title: 'Cha Coding', onPage: HeroPage()),
            SizedBox(height: 2.0),
            Column(
              children: List.generate(title.length, (index) {
                return CardWidget(
                  title: title.elementAt(index),
                  description: Description.elementAt(index),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
