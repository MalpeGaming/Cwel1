import 'package:flutter/material.dart';
import 'title_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  List<ThemeMode> themes = [ThemeMode.light, ThemeMode.dark];
  int actTheme = 0;
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Brain Train App',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 0, 89, 255),
          onPrimary: Color.fromARGB(255, 5, 57, 155),
          secondary: Color.fromARGB(255, 143, 193, 255),
          onSecondary: Colors.black,
          tertiary: Colors.white,
          background: Color.fromARGB(255, 236, 252, 255),
          error: Color.fromARGB(255, 238, 51, 38),
        ),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 15, 121, 219),
          onPrimary: Color.fromARGB(255, 150, 196, 255),
          secondary: Color.fromARGB(255, 102, 148, 190),
          onSecondary: Colors.white,
          tertiary: Colors.black,
          background: Color.fromARGB(255, 12, 32, 70),
          error: Color.fromARGB(255, 234, 31, 17),
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: const TitlePage(title: 'The Brain Train App'),
    );
  }

  void switchTheme() {
    setState(
      () {
        actTheme = actTheme ^ 1;
        _themeMode = themes[actTheme];
      },
    );
  }
}
