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
          primary: Color(0xFF86B6F6),
          onPrimary: Color.fromARGB(255, 21, 100, 126),
          secondary: Color.fromARGB(255, 139, 185, 245),
          onSecondary: Colors.black,
          background: Color(0xFFE8F9FD),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
            primary: Color.fromARGB(255, 126, 33, 61),
            onPrimary: Color(0xFFF05941),
            secondary: Color(0xFFBE3144),
            onSecondary: Colors.white,
            background: Color(0xFF22092C),
            
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
