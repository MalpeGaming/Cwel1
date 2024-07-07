import 'package:flutter/material.dart';
import '../../app_bar.dart';
import '../../buttons.dart';

class Info extends StatefulWidget {
  const Info({super.key});
  @override
  State<Info> createState() => _Info();
}

class _Info extends State<Info> {
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
                style: TextStyle(fontSize: 0.07 * size.height),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                "INTELLIGENCE",
                style: TextStyle(fontSize: 0.04 * size.height),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.04 * size.height),
            Text(
              " Exercise 1 -  Poems Reading Out-Loud",
              style: TextStyle(fontSize: 0.04 * size.width),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 0.04 * size.height),
            Text(
              "In this exercises you will be given a popular poem by some of the best-known authors. You task is to read the poems in the correct speed with proper pronunciation. You can repeat the task as many times as you want.",
              style: TextStyle(fontSize: size.width / 40),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const Info(),
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
