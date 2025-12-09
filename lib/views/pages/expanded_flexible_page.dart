import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatefulWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  State<ExpandedFlexiblePage> createState() => _ExpandedFlexiblePageState();
}

class _ExpandedFlexiblePageState extends State<ExpandedFlexiblePage> {
  bool switchOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.pink,
                  child: Text('hello world'),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.amber,
                  child: Text('Hello world'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
