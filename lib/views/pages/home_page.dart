import 'package:flutter/material.dart';
import 'package:news/data/constants.dart';
import 'package:news/views/pages/hero_page.dart';
import 'package:news/views/pages/login_page.dart';
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
            HeroWidget(title: 'Cha Coding', onPage: LoginPage()),
            Column(
              children: List.generate(title.length, (index) {
                return CardWidget(
                  title: title.elementAt(index),
                  description: Description.elementAt(index),
                );
              }),
            ),

            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.pink,
                    duration: Duration(seconds: 5),
                    content: Text(
                      "This is the snackbar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              child: Text("Show Snackbar"),
            ),
            Divider(
              height: 20.0,
              thickness: 2.0,
              color: Colors.teal,
              indent: 30.0,
              endIndent: 30.0,
            ),
            SizedBox(height: 30.0, child: VerticalDivider(color: Colors.blue)),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      title: Text("Alert Dialog"),
                      content: Text("Text for Alert Dialog"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Alert Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
