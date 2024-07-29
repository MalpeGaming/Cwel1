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

  int numerek = 0;

  Future<void> calcDay() async {
    DateTime firstDay = DateTime.now();
    DateTime today = DateTime.now();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('beginning_date') != null) {
      firstDay = DateTime.parse(prefs.getString('beginning_date')!);
    }

    setState(() {
      numerek = today.difference(firstDay).inDays + 1;
      zdjecie = "assets/memes/$numerek.png";
    });
  }

  Future<void> readMemory() async {
    prefs = await SharedPreferences.getInstance();
    String? beginningDate = prefs.getStringList('beginning_date')?.first;
    if (beginningDate != null) {
      DateTime beginningDateTime = DateTime.parse(beginningDate);
      Duration daysPassed = DateTime.now().difference(beginningDateTime);
      numerek = (daysPassed.inDays) % 30;
      setState(() {
        zdjecie = "assets/memes/$numerek.png";
      });
    }
  }

  String zdjecie = "assets/memes/0.png";
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
