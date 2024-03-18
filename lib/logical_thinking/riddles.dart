import 'package:flutter/material.dart';
import '../buttons.dart';

import 'problem.dart';

class Riddles extends StatefulWidget {
  final bool? initialTest;
  const Riddles({this.initialTest = false, super.key});

  @override
  State<Riddles> createState() => _Riddles();
}

class _Riddles extends State<Riddles> {
  bool initialTest = false;

  @override
  void initState() {
    super.initState();
    initialTest = widget.initialTest!;
    print(initialTest);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
          bottom: size.height / 10,
        ),
        child: Column(
          children: [
            SizedBox(height: 0.05 * size.height),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "RIDDLES",
                    style: TextStyle(fontSize: 0.08 * size.height),
                  ),
                  Text(
                    "THINKING",
                    style: TextStyle(fontSize: 0.035 * size.height),
                  ),
                  Text(
                    "Exercise 2 -  Math riddles",
                    style: TextStyle(fontSize: 0.03 * size.height),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 0.022 * size.height,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      children: const [
                        TextSpan(
                          text:
                              "In this exercises you will complete part of the ",
                        ),
                        TextSpan(
                          text: "SAT Math with CALCULATOR",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " Part.",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.015 * size.height),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 0.022 * size.height,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      children: const [
                        TextSpan(
                          text: "You will have ",
                        ),
                        TextSpan(
                          text: "350 seconds",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ".",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.015 * size.height),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 0.022 * size.height,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      children: const [
                        TextSpan(
                          text: "When ready click \" ",
                        ),
                        TextSpan(
                          text: "CONTINUE",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ".\"",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const ProblemSelection(
                    riddlesMode: true,
                    testVersion: true,
                  ),
                  text: 'Continue',
                  width: size.width,
                ),
              ),
            ),
            SizedBox(height: 0.1 * size.height),
          ],
        ),
      ),
    );
  }
}
