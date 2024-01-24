import 'package:flutter/material.dart';
import '../navbar.dart';

class CalRequirementsCalc extends StatefulWidget {
  const CalRequirementsCalc({super.key});

  @override
  State<CalRequirementsCalc> createState() => _CalRequirementsCalc();
}

class _CalRequirementsCalc extends State<CalRequirementsCalc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    "CALORIE DAILY REQUIREMENTS",
                    style: TextStyle(
                      fontSize: size.width / 8.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    "The calculator works for adults between the ages of 18-52.",
                    style: TextStyle(fontSize: size.width / 26),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.05 * size.height),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
