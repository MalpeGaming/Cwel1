import 'package:flutter/material.dart';
import '../../app_bar.dart';

class ReadingStreak extends StatefulWidget {
  const ReadingStreak({super.key});
  @override
  State<ReadingStreak> createState() => _ReadingStreak();
}

class _ReadingStreak extends State<ReadingStreak> {
  bool ticked = false;

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        ),
      ),
    );
  }
}
