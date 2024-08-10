import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:brain_train_app/app_bar.dart';

class Meme extends StatefulWidget {
  const Meme({super.key});

  @override
  _MemeState createState() => _MemeState();
}

class _MemeState extends State<Meme> {
  late SharedPreferences prefs;

  int day = 0;
  String zdjecie = "assets/memes/1.png";

  Future<void> calcDay() async {
    DateTime firstDay = DateTime.now();
    DateTime today = DateTime.now();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('beginning_date') != null) {
      firstDay = DateTime.parse(prefs.getString('beginning_date')!);
    }
    day = today.difference(firstDay).inDays + 1;

    setState(() {
      zdjecie = "assets/memes/$day.png";
    });
  }

  @override
  void initState() {
    super.initState();
    calcDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ""),
      body: Center(
        child: Image.asset(zdjecie),
      ),
    );
  }
}
