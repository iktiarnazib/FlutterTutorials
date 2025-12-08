import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.pink,
                  child: Text('Hello world'),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  height: 30,
                  color: Colors.blue,
                  child: Text('Hello world gklsdfgdklgdsgksdgkd'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
