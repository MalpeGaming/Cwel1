import 'package:flutter/material.dart';
import '../../app_bar.dart';

class ScrabbleInfo extends StatefulWidget {
  const ScrabbleInfo({
    super.key,
  });

  @override
  State<ScrabbleInfo> createState() => _ScrabbleInfo();
}

class _ScrabbleInfo extends State<ScrabbleInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
          bottom: size.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "INSTRUCTIONS",
                style: TextStyle(fontSize: 0.08 * size.width),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.04 * size.height),
            Text(
              "In this activity, you will receive 9 letters. Click on the letters to form a word. If the word exists then, click 'Continue' to receive your points.",
              style: TextStyle(fontSize: 0.05 * size.width),
            ),
          ],
        ),
      ),
    );
  }
}
