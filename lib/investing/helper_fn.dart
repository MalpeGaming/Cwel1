import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget keyVocabulary(BuildContext context, String text, String definition) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.020,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        definition,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.020,
        ),
      ),
    ],
  );
}

Widget createDivider(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      SizedBox(height: size.height / 20),
      Divider(
        color: Theme.of(context).colorScheme.primary,
        thickness: size.height / 200,
      ),
      SizedBox(height: size.height / 20),
    ],
  );
}

Future<void> saveResult(int lessonId, int score) async {
  late SharedPreferences prefs;

  prefs = await SharedPreferences.getInstance();
  prefs.setInt('lesson$lessonId', score);
  //print("amogus");
}

        //initMemory();