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
          SwitchListTile.adaptive(
            title: Row(
              children: [
                Icon(Icons.person),
                Text('Person'),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.ring_volume), Text('Ring')],
                  ),
                ),
              ],
            ),
            value: switchOff,
            onChanged: (bool value) {
              setState(() {
                switchOff = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
