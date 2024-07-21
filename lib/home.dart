import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:intl/intl.dart';
import 'navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    var formatter = DateFormat('E. dd MMM');
    String formattedDate = formatter.format(now);
    Future<void> readMemory() async {
      prefs = await SharedPreferences.getInstance();
      print("amogus");
      print(prefs.getString('beginning_date'));
      String? beginningDate = prefs.getString('beginning_date');
      if (beginningDate != null) {
        DateTime beginningDateTime = DateTime.parse(beginningDate);
        Duration daysPassed = DateTime.now().difference(beginningDateTime);
        print("Days passed since beginning date: ${daysPassed.inDays}");
      }
    }

    readMemory();
    //print("Xd");
    //readMemory();

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
          top: size.height / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "YOUR PLAN",
                    style: TextStyle(
                      fontSize: size.width / 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    "DAY 1 - ${formattedDate.toString().toUpperCase()}",
                    style: TextStyle(fontSize: size.width / 17),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.05 * size.height),
            Text(
              "Base program",
              style: TextStyle(
                fontSize: size.width / 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            ListTile(
              autofocus: true,
              leading: Radio<int>(
                value: 1,
                groupValue: 1,
                //activeColor: Theme.of(context).colorScheme.primary,
                fillColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary,
                ),
                splashRadius: 25,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
