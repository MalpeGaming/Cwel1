import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'lesson16/main.dart';
import '../app_bar.dart';

class InvestingMenu extends StatefulWidget {
  const InvestingMenu({super.key});
  @override
  State<InvestingMenu> createState() => _InvestingMenu();
}

GestureDetector createLesson(
  BuildContext context,
  String text,
  Widget route,
  int number,
) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ),
      );
    },
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              (number == 0) ? Icons.done_rounded : Icons.done_all_rounded,
              size: 0.1 * size.width,
              color: (number == 0)
                  ? Theme.of(context).colorScheme.onSecondary.withOpacity(0.3)
                  : Colors.green,
            ),
            SizedBox(width: 0.025 * size.width),
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
                width: size.width * 0.7,
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
                          fontSize: size.width / 22,
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
          ],
        ),
        SizedBox(height: 0.025 * size.height),
      ],
    ),
  );
}

class _InvestingMenu extends State<InvestingMenu> {
  late SharedPreferences prefs;
  List<int?> scores = List<int?>.filled(13, null);
  int sum = 0;

  Future<void> readMemory() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i <= 12; i++) {
        scores[i] = prefs.getInt('lesson$i')?.toInt();
        if (scores[i] != null) {
          sum += scores[i]!;
        }
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
          left: size.width / 15,
          right: size.width / 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "INVESTING",
                style: TextStyle(
                  fontSize: size.width / 9,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.width / 25),
                Text(
                  "COURSE",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(width: size.width / 20),
                Container(
                  height: 0.04 * size.height,
                  width: 0.2 * size.width,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      sum.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 25),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: size.height / 40),
                  createLesson(
                    context,
                    "Intro",
                    const Intro(),
                    scores[0] ?? 0,
                  ),
                  createLesson(
                    context,
                    "1. Why Should You Invest?",
                    const Lesson1(),
                    scores[1] ?? 0,
                  ),
                  createLesson(
                    context,
                    "2. Why should you invest continuation ? ",
                    const Lesson2(),
                    scores[2] ?? 0,
                  ),
                  createLesson(
                    context,
                    "3. Is investing really gambling ?",
                    const Lesson3(),
                    scores[3] ?? 0,
                  ),
                  createLesson(
                    context,
                    "4. What are stocks ?",
                    const Lesson4(),
                    scores[4] ?? 0,
                  ),
                  createLesson(
                    context,
                    "5. What are bonds ?",
                    const Lesson5(),
                    scores[5] ?? 0,
                  ),
                  createLesson(
                    context,
                    "6. Key Financial Metrics",
                    const Lesson6(),
                    scores[6] ?? 0,
                  ),
                  createLesson(
                    context,
                    "7. Key Financial Metrics part 2",
                    const Lesson7(),
                    scores[7] ?? 0,
                  ),
                  createLesson(
                    context,
                    "8. Final Key Metrics Quiz",
                    const Lesson8(),
                    scores[8] ?? 0,
                  ),
                  createLesson(
                    context,
                    "9. Value / Growth Stocks",
                    const Lesson9(),
                    scores[9] ?? 0,
                  ),
                  createLesson(
                    context,
                    "10. How to choose a stock ?",
                    const Lesson10(),
                    scores[10] ?? 0,
                  ),
                  createLesson(
                    context,
                    "11. Key Financial Metrics for Bonds",
                    const Lesson11(),
                    scores[11] ?? 0,
                  ),
                  createLesson(
                    context,
                    "12. How to choose a bond ? ",
                    const Lesson12(),
                    scores[12] ?? 0,
                  ),
                  createLesson(
                    context,
                    "16. What are ETFs ? ",
                    const Lesson16(),
                    scores[12] ?? 0,
                  ),
                  SizedBox(height: size.height / 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
