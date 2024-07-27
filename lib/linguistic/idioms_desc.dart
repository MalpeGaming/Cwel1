import 'package:flutter/material.dart';
import '../../app_bar.dart';
import '../../buttons.dart';
import 'idioms.dart';
import '../score_n_progress/show_improvement.dart';

class IdiomsDesc extends StatefulWidget {
  const IdiomsDesc({
    this.initialTest = false,
    this.endingTest = false,
    super.key,
  });

  final bool initialTest;
  final bool endingTest;

  @override
  State<IdiomsDesc> createState() => _IdiomsDesc();
}

class _IdiomsDesc extends State<IdiomsDesc> {
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
                "LINGUISTIC",
                style: TextStyle(fontSize: 0.14 * size.width),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                "INTELLIGENCE",
                style: TextStyle(fontSize: 0.08 * size.width),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.04 * size.height),
            Text(
              "Exercise 1 - Idioms, expressions, and phrasal verbs.",
              style: TextStyle(fontSize: 0.05 * size.width),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 0.04 * size.height),
            Text(
              "In the following exercise you will have  60 seconds to complete as many exercises as you can.\n\nFor each correctly completed exercise you will get 1 point and for each mistake you will lose 0.5 points.\n\nClick “Continue” when you are ready.",
              style: TextStyle(fontSize: size.height / 50),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const Idioms(),
                  text: 'Continue',
                  width: size.width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
