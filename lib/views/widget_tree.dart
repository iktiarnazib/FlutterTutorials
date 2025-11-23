import 'package:flutter/material.dart';
import 'package:news/data/notifiers.dart';
import 'package:news/views/pages/home_page.dart';
import 'package:news/views/pages/profile_page.dart';
import 'package:news/views/pages/work_page.dart';
import 'package:news/views/widgets/nav_bar_widget.dart';

List<Widget> pageList = [HomePage(), WorkPage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cha Coding'),
        backgroundColor: Colors.teal[800],
        actions: [
          Text("Exit", style: TextStyle(fontSize: 18.0)),
          Icon(Icons.exit_to_app, size: 30.0),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, dynamic selectedIndex, Widget? child) {
          return pageList.elementAt(selectedIndex);
        },
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
