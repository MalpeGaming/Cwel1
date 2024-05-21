import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Meme extends StatefulWidget {
  @override
  _MemeState createState() => _MemeState();
}

class _MemeState extends State<Meme> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    readMemory();
  }

  Future<int> readMemory() async {
    prefs = await SharedPreferences.getInstance();
    print("amogus");
    print(prefs.getStringList('beginning_date').toString());
    String? beginningDate = prefs.getStringList('beginning_date')?.first;
    if (beginningDate != null) {
      DateTime beginningDateTime = DateTime.parse(beginningDate);
      Duration daysPassed = DateTime.now().difference(beginningDateTime);
      print("Days passed since beginning date: ${daysPassed.inDays}");
      return daysPassed.inDays;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    int xd = -1;
    checkValue() async {
      xd = await readMemory();
    }

    String zdjecie = "";
    checkValue();
    print("sadfhkjas");
    print(xd);
    int numerek = 0;
    setState(() {
      zdjecie = "assets/memes/" + numerek.toString() + ".png";
      print(zdjecie);
    });
    return Scaffold(
      body: Center(
        child: Image.asset(zdjecie),
      ),
    );
  }
}
