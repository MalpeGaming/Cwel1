import 'package:flutter/material.dart';
import 'intro.dart';
import 'lesson1/main.dart';
import 'lesson2/main.dart';
import 'lesson3/main.dart';
import 'lesson4/main.dart';
import 'lesson5/main.dart';
import 'lesson6/main.dart';
import 'lesson7/main.dart';
import 'lesson8/main.dart';
import 'lesson9/main.dart';
import 'lesson10/main.dart';
import 'lesson11/main.dart';
import 'lesson12/main.dart';

class InvestingMenu extends StatefulWidget {
  const InvestingMenu({super.key});
  @override
  State<InvestingMenu> createState() => _InvestingMenu();
}

GestureDetector createLesson(
  BuildContext context,
  String text,
  Widget route,
) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ),
      );
    },
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.onPrimary,
              ],
              tileMode: TileMode.decal,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          height: 0.1 * size.height,
          child: SizedBox(
            width: size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 0.025 * size.height),
      ],
    ),
  );
}

class _InvestingMenu extends State<InvestingMenu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
          top: size.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "INVESTING COURSE",
                style: TextStyle(
                  fontSize: size.width / 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                "MENU",
                style: TextStyle(fontSize: size.width / 17),
              ),
            ),
            SizedBox(height: size.height / 20),
            Expanded(
              child: ListView(
                children: [
                  createLesson(
                    context,
                    "Intro",
                    const Intro(),
                  ),
                  createLesson(
                    context,
                    "1. Why Should You Invest?",
                    const Lesson1(),
                  ),
                  createLesson(
                    context,
                    "2. Why should you invest continuation ? ",
                    const Lesson2(),
                  ),
                  createLesson(
                    context,
                    "3. Is investing really gambling ?",
                    const Lesson3(),
                  ),
                  createLesson(
                    context,
                    "4. What are stocks ?",
                    const Lesson4(),
                  ),
                  createLesson(
                    context,
                    "5. What are bonds ?",
                    const Lesson5(),
                  ),
                  createLesson(
                    context,
                    "6. Key Financial Metrics",
                    const Lesson6(),
                  ),
                  createLesson(
                    context,
                    "7. Key Financial Metrics part 2",
                    const Lesson7(),
                  ),
                  createLesson(
                    context,
                    "8. Final Key Metrics Quiz",
                    const Lesson8(),
                  ),
                  createLesson(
                    context,
                    "9. Value / Growth Stocks",
                    const Lesson9(),
                  ),
                  createLesson(
                    context,
                    "10. How to choose a stock ?",
                    const Lesson10(),
                  ),
                  createLesson(
                    context,
                    "11. Key Financial Metrics for Bonds",
                    const Lesson11(),
                  ),
                  createLesson(
                    context,
                    "12. How to choose a bond ? ",
                    const Lesson12(),
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
