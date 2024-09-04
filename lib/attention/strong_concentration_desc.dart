import 'package:brain_train_app/app_bar.dart';
import 'package:flutter/material.dart';
import 'strong_concentration.dart';
import '/buttons.dart';

class StrongConcentrationDesc extends StatefulWidget {
  const StrongConcentrationDesc({
    super.key,
    this.initialTest = false,
    this.endingTest = false,
  });

  final bool initialTest;
  final bool endingTest;

  @override
  State<StrongConcentrationDesc> createState() => _StrongConcentrationDesc();
}

class _StrongConcentrationDesc extends State<StrongConcentrationDesc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        width: size.width * 0.9,
        height: size.height * 0.9,
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
          bottom: size.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "ATTENTION",
                    style: TextStyle(
                      fontSize: size.width / 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                Text(
                  "Exercise 3 - Strong Concentration",
                  style: TextStyle(fontSize: size.width / 20),
                ),
                SizedBox(
                  height: size.height / 25,
                ),
                Text(
                  "In this exercises while doing simple math exercises, you will be listening to dynamic music.",
                  style: TextStyle(fontSize: size.width / 24),
                ),
                SizedBox(
                  height: size.height / 25,
                ),
                Text(
                  "Remember to tap ✓ on keyboard after finishing last excercise.",
                  style: TextStyle(fontSize: size.width / 24),
                ),
                SizedBox(
                  height: size.height / 25,
                ),
                Text(
                  "Turn the volume up.",
                  style: TextStyle(fontSize: size.width / 24),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
              ],
            ),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    route: StrongConcentration(
                      initialTest: widget.initialTest,
                      endingTest: widget.endingTest,
                    ),
                    text: 'Continue',
                    width: size.width,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
