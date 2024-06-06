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

  Future<void> readMemory() async {
    prefs = await SharedPreferences.getInstance();
    print("amogus");
    print(prefs.getStringList('beginning_date').toString());
    String? beginningDate = prefs.getStringList('beginning_date')?.first;
    if (beginningDate != null) {
      DateTime beginningDateTime = DateTime.parse(beginningDate);
      Duration daysPassed = DateTime.now().difference(beginningDateTime);
      print("Days passed since beginning date: ${daysPassed.inDays}");
      numerek = (daysPassed.inDays) % 30;
      setState(() {
        zdjecie = "assets/memes/$numerek.png";
      });
      print(zdjecie);
    }
  }

  String zdjecie = "assets/memes/0.png";
  @override
  void initState() {
    super.initState();
    readMemory();
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
