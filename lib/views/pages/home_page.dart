import 'package:flutter/material.dart';
import 'package:news/data/constants.dart';
import '../widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeroWidget(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This is Cha Coding",
                            style: KTextStyle.titleTextSyle,
                          ),
                          Text(
                            "Learn flutter from Cha Coding with Iktiar, This is an app that helps learn flutter",
                            style: KTextStyle.descriptionTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This is Cha Coding",
                            style: KTextStyle.titleTextSyle,
                          ),
                          Text(
                            "Learn flutter from Cha Coding with Iktiar, This is an app that helps learn flutter",
                            style: KTextStyle.descriptionTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "This is Cha Coding",
                            style: KTextStyle.titleTextSyle,
                          ),
                          Text(
                            "Learn flutter from Cha Coding with Iktiar, This is an app that helps learn flutter",
                            style: KTextStyle.descriptionTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
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
            Container(height: 30.0, child: VerticalDivider(color: Colors.blue)),
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
