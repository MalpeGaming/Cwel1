import 'package:flutter/material.dart';
import '../../app_bar.dart';
import '../../your_activities.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _Business();
}

class _Business extends State<Business> {
  Widget createActivity2(
    BuildContext context,
    String img,
    String txt1,
    String txt2, {
    double fontSize = 1,
  }) {
    Size size = MediaQuery.of(context).size;
    return createActivity(
      context,
      "attention/reading/$img",
      txt1,
      txt2,
      0.025 * size.height * fontSize,
      const Business(),
      const Color.fromARGB(255, 143, 0, 226),
      const Color.fromARGB(255, 101, 0, 184),
      zero: 0.8,
      blocked: true,
      textWidth: 0.4,
      title: true,
    );
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "BUSINESS",
                  style: TextStyle(
                    fontSize: size.width / 8,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "& MONEY",
                  style: TextStyle(
                    fontSize: size.width / 18,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 0.03 * size.height),
            Expanded(
              child: ListView(
                children: [
                  createActivity2(
                    context,
                    "business/the_richest_man_in_babylon",
                    "The Richest Man in Babylon",
                    "by George Samuel Clason",
                    fontSize: 0.9,
                  ),
                  createActivity2(
                    context,
                    "business/rich_dad_poor_dad",
                    "Rich Dad Poor Dad",
                    "by Robert T. Kiyosaki",
                  ),
                  createActivity2(
                    context,
                    "business/the_intelligent_investor",
                    "The Intelligent Investor",
                    "by Benjamin Graham",
                  ),
                  createActivity2(
                    context,
                    "business/principles",
                    "Principles: Life and Work",
                    "by Ray Dalio",
                  ),
                  createActivity2(
                    context,
                    "business/influence",
                    "Influence: The Psychology of Persuasion",
                    "by Robert B. Cialdini",
                    fontSize: 0.85,
                  ),
                  createActivity2(
                    context,
                    "business/the_magic_of_thinking_big",
                    "The Magic Of Thinking Big",
                    "by David J. Schwartz",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
