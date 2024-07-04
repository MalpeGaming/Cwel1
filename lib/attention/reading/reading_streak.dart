import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_bar.dart';

class ReadingStreak extends StatefulWidget {
  const ReadingStreak({super.key});
  @override
  State<ReadingStreak> createState() => _ReadingStreak();
}

class _ReadingStreak extends State<ReadingStreak> {
  bool ticked = false;
  late SharedPreferences prefs;
  List<int?> streak = List<int?>.filled(31, null);

  Widget createDay(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (streak[index] == 0 || streak[index] == null)
            ? Colors.grey[200]
            : Colors.green,
      ),
      width: size.width / 8,
      height: size.width / 8,
      //color: Colors.grey[200],
      child: Center(child: Text(index.toString())),
    );
  }

  Future<void> readMemory() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 1; i <= 30; i++) {
        streak[i] = prefs.getInt('readingDay$i')?.toInt();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    readMemory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "YOUR READING STREAK",
                style: TextStyle(
                  fontSize: size.width / 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.width / 10,
            ),
            Column(
              children: [
                for (int i = 0; i < 6; i++)
                  Row(
                    children: [
                      for (int j = 0; j < 5; j++)
                        Expanded(
                          child: Column(
                            children: [
                              createDay(context, 5 * i + j + 1),
                              SizedBox(
                                height: size.width / 30,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                SizedBox(
                  width: size.width / 30,
                ),
              ],
            ),
            Text(streak.toString()),
          ],
        ),
      ),
    );
  }
}
