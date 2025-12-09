import 'package:flutter/material.dart';
import 'package:news/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/notifiers.dart';
import 'views/pages/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? repeat = prefs.getBool(KConstants.themeMode);
  isDarkModeNotifier.value = repeat ?? true;
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
          home: WelcomePage(),
        );
      },
    );
  }
}
