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
          ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (BuildContext context, dynamic isDarkMode, Widget? child) {
              return isDarkMode
                  ? Text("Dark mode", style: TextStyle(fontSize: 18.0))
                  : Text("Light mode", style: TextStyle(fontSize: 18.0));
            },
          ),
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder:
                  (BuildContext context, dynamic isDarkMode, Widget? child) {
                    return isDarkMode
                        ? Icon(Icons.dark_mode)
                        : Icon(Icons.light_mode);
                  },
            ),
          ),
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
