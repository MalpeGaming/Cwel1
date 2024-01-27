import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'navbar.dart';
import 'self_reflection.dart';
import 'meditation.dart';
import 'sport.dart';

class YourActivities extends StatefulWidget {
  const YourActivities({super.key});
  @override
  State<YourActivities> createState() => _YourActivities();
}

GestureDetector createActivity(BuildContext context, String img, String text1,
    String text2, double fontSize, Widget route,
    {int zero = 1}) {
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
          ),
          height: 0.12 * size.height,
          child: Row(
            children: [
              SizedBox(
                height: 0.12 * size.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    child: Image.asset('assets/$img.png', fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 0.05 * size.width),
              SizedBox(
                width: size.width * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: zero * fontSize,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0.025 * size.height),
      ],
    ),
  );
}

class _YourActivities extends State<YourActivities> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    var formatter = DateFormat('E. dd MMM');
    String formattedDate = formatter.format(now);

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
                "YOUR ACTIVITIES",
                style: TextStyle(
                    fontSize: size.width / 10, fontWeight: FontWeight.w500),
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
            SizedBox(height: 0.02 * size.height),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: size.width / 20,
                      right: size.width / 20,
                    ),
                    child: Column(
                      children: [
                        createActivity(
                          context,
                          "activities/learning_course",
                          "LEARNING",
                          "Course",
                          0.025 * size.height,
                          const YourActivities(),
                        ),
                        createActivity(
                          context,
                          "activities/working_memory",
                          "Working",
                          "MEMORY",
                          0.025 * size.height,
                          const YourActivities(),
                        ),
                        createActivity(
                          context,
                          "activities/memory_game",
                          "MEMORY",
                          "Game",
                          0.025 * size.height,
                          const YourActivities(),
                        ),
                        createActivity(
                          context,
                          "activities/sport",
                          "SPORT",
                          "Optional",
                          0.025 * size.height,
                          const Sport(),
                        ),
                        createActivity(
                          context,
                          "activities/self_reflection",
                          "Self",
                          "Reflection",
                          0.025 * size.height,
                          const SelfReflection(),
                        ),
                        createActivity(
                          context,
                          "activities/good_deed",
                          "GOOD",
                          "Deed",
                          0.025 * size.height,
                          const YourActivities(),
                        ),
                        createActivity(
                            context,
                            "activities/meditation",
                            "MEDITATION",
                            "",
                            0.025 * size.height,
                            const Meditation(),
                            zero: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
