import 'package:flutter/material.dart';
import 'package:news/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/notifiers.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'widgets/nav_bar_widget.dart';

List<Widget> pageList = [HomePage(), ProfilePage()];

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
            onPressed: () async {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.themeMode,
                isDarkModeNotifier.value,
              );
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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: "Settings 1");
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
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
