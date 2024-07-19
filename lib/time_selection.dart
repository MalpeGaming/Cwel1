import 'package:flutter/material.dart';
import 'improvement_selection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeSelection extends StatefulWidget {
  const TimeSelection({super.key});

  @override
  State<TimeSelection> createState() => _TimeSelectionState();
}

Widget timeButton(BuildContext context, int txt) {
  Size size = MediaQuery.of(context).size;
  late SharedPreferences prefs;

  return InkWell(
    onTap: () {
      Future<void> initMemory() async {
        prefs = await SharedPreferences.getInstance();
        prefs.setInt('training_time', txt);
      }

      initMemory();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ImprovementSelection(),
        ),
      );
    },
    child: Container(
      width: size.width * 0.5,
      height: size.height / 9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
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
      child: Center(
        child: Text(
          "$txt min",
          style: TextStyle(
            fontSize: size.width / 16,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ),
    ),
  );
}

class _TimeSelectionState extends State<TimeSelection> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "How much time would you like to train a day?",
              style: TextStyle(
                fontSize: size.width / 13,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 0.1 * size.height),
            timeButton(context, 10),
            SizedBox(height: 0.05 * size.height),
            timeButton(context, 15),
            SizedBox(height: 0.05 * size.height),
            timeButton(context, 20),
          ],
        ),
      ),
    );
  }
}
