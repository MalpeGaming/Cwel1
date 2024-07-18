import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:brain_train_app/title_page.dart';

class Restart extends StatefulWidget {
  const Restart({super.key});

  @override
  State<Restart> createState() => _Restart();
}

class _Restart extends State<Restart> {
  bool initialTest = false;
  Future<void> restartApp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  initState() {
    restartApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const TitlePage(title: 'The Brain Train App');
  }
}
