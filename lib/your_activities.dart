import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'navbar.dart';

class YourActivities extends StatefulWidget {
  const YourActivities({super.key});
  @override
  State<YourActivities> createState() => _YourActivities();
}

class _YourActivities extends State<YourActivities> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    var formatter = DateFormat('E. dd MMM');
    String formattedDate = formatter.format(now);

    Column createActivity(
        BuildContext context, String img, String text1, String text2,
        {int zero = 1}) {
      return Column(
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
                      child: Image.asset('assets/activities/$img.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(width: 0.05 * size.width),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 0.025 * size.height,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: zero * 0.025 * size.height,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 0.015 * size.height),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    left: size.width / 20,
                    right: size.width / 20,
                    top: size.height / 20,
                  ),
                  child: Column(
                    children: [
                      createActivity(
                          context, "learning_course", "LEARNING", "Course"),
                      createActivity(
                          context, "working_memory", "Working", "MEMORY"),
                      createActivity(context, "memory_game", "MEMORY", "Game"),
                      createActivity(context, "sport", "SPORT", "Optional"),
                      createActivity(
                          context, "self_reflection", "Self", "Reflection"),
                      createActivity(context, "good_deed", "GOOD", "Deed"),
                      createActivity(context, "meditation", "MEDITATION", "",
                          zero: 0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
