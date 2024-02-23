import 'package:flutter/material.dart';
import '../../app_bar.dart';
import '../../your_activities.dart';

class PersonalDevelopment extends StatefulWidget {
  const PersonalDevelopment({super.key});

  @override
  State<PersonalDevelopment> createState() => _PersonalDevelopment();
}

class _PersonalDevelopment extends State<PersonalDevelopment> {
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
      const PersonalDevelopment(),
      const Color.fromARGB(255, 221, 65, 221),
      const Color.fromARGB(255, 137, 39, 176),
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
                  "PERSONAL",
                  style: TextStyle(
                    fontSize: size.width / 8,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "DEVELOPMENT",
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
                    "personal_development/how_to_win_friends",
                    "How to Win Friends and Influence People",
                    "by Dale Carnegie",
                    fontSize: 0.85,
                  ),
                  createActivity2(
                    context,
                    "personal_development/the_power_of_habit",
                    "The Power of Habit: Why We Do What We Do in Life and Business",
                    "by Charles Duhigg",
                    fontSize: 0.7,
                  ),
                  createActivity2(
                    context,
                    "personal_development/the_power_of_now",
                    "The Power of Now: A Guide to Spiritual Enlightenment",
                    "by Eckhart Tolle",
                    fontSize: 0.8,
                  ),
                  createActivity2(
                    context,
                    "personal_development/the_subtle_art",
                    "The Subtle Art of Not Giving a F*ck",
                    "by Mark Manson",
                    fontSize: 0.9,
                  ),
                  createActivity2(
                    context,
                    "personal_development/atomic_habits",
                    "Atomic Habits",
                    "by James Clear",
                  ),
                  createActivity2(
                    context,
                    "personal_development/sapiens",
                    "Sapiens: A Brief History of Humankind",
                    "by Yuval Noah Harari",
                    fontSize: 0.8,
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
