import 'package:flutter/material.dart';
import 'title_page.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
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
          primary: Color.fromARGB(255, 133, 138, 227),
          onPrimary: Color.fromARGB(255, 95, 102, 248),
          secondary: Color.fromARGB(255, 244, 250, 255),
          onSecondary: Colors.black,
          tertiary: Colors.white,
          surface: Color.fromARGB(255, 252, 252, 252),
          error: Color.fromARGB(255, 238, 51, 38),
          shadow: Color.fromARGB(255, 167, 167, 167),
        ),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 126, 82, 160),
          onPrimary: Color.fromARGB(255, 117, 72, 151),
          secondary: Color.fromARGB(255, 102, 148, 190),
          onSecondary: Colors.white,
          tertiary: Colors.black,
          surface: Color.fromARGB(255, 19, 19, 19),
          error: Color.fromARGB(255, 234, 31, 17),
          shadow: Color.fromARGB(255, 0, 0, 0),
        ),
        useMaterial3: true,
        fontFamily: 'Arial',
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
