import 'package:flutter/material.dart';
import 'strong_concentration.dart';

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
      body: Container(
        width: size.width * 0.9,
        height: size.height * 0.9,
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
          top: size.height / 10,
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
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StrongConcentration(
                          initialTest: widget.initialTest,
                          endingTest: widget.endingTest,
                        ),
                      ),
                    );
                  },
                  tooltip: 'Continue',
                  label: Text(
                    "Continue",
                    style: TextStyle(fontSize: size.width / 16),
                  ),
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    size: size.width / 16,
                  ),
                  backgroundColor: Colors.blue[400],
                  hoverColor: Colors.blue[900],
                  autofocus: true,
                  heroTag: "continue",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
