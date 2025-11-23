import 'package:flutter/material.dart';
import 'package:news/data/notifiers.dart';
import 'package:news/views/widget_tree.dart';
import 'package:news/views/widgets/nav_bar_widget.dart';

void main() {
  runApp(const MyApp());
}

//stateful widget
//appbar
//body
//bottom navigation bar

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (BuildContext context, dynamic isDarkMode, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WidgetTree(),
        );
      },
    );
  }
}
