import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '/account/login1.dart';
import '../score_n_progress/progress_screen.dart';
import '../score_n_progress/show_score.dart';
import '/buttons.dart';
import '/app_bar.dart';

class StrongConcentration extends StatefulWidget {
  const StrongConcentration({super.key, this.initialTest = false});

  final bool initialTest;

  @override
  State<StrongConcentration> createState() => _StrongConcentration();
}

class _StrongConcentration extends State<StrongConcentration> {
  int _id = 0;
  int _remainingTime = 130;
  late Timer _timer;
  List<double> correctAnswers = [
    722,
    465,
    90,
    9,
    72,
    12,
    135,
    1.625,
    81,
    800,
    7,
    6,
  ];
  List<double> userAnswers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  double score = 0;

  Future<void> startTimer() async {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (_remainingTime > 0) {
              _remainingTime--;
            } else {
              Navigator.pop(context);
              _timer.cancel();
              double score = countScore();

              if (widget.initialTest) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowScore(
                      title: "ATTENTION",
                      description: "Exercise 3 - Strong Concentration",
                      exercise: 3,
                      yourScore: score,
                      maximum: 10,
                      page: const Login1(),
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgressScreen(
                      name: "strong_concentration",
                      score: score,
                    ),
                  ),
                );
              }
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Column equasion(Row text, Size size, {bool isId = true}) {
    _id++;
    final thisId = _id;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            isId ? Text("$thisId.   ") : const SizedBox(height: 0, width: 0),
            text,
            SizedBox(
              width: size.width / 6,
              height: size.height / 36,
              child: TextField(
                style: TextStyle(fontSize: size.width / 30),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[\d.]")),
                  TextInputFormatter.withFunction(
                    (oldValue, newValue) {
                      String text = newValue.text;
                      if (text.isNotEmpty) {
                        userAnswers[thisId - 1] = double.parse(text);
                      }
                      return newValue;
                    },
                  ),
                ],
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height / 50,
        ),
      ],
    );
  }

  double countScore() {
    double score = 0;

    for (var i = 0; i < 12; i++) {
      if (userAnswers[i] == correctAnswers[i]) {
        score++;
      }
    }
    return score;
  }

  Row createEquasion(double smallText, String text, {bool isId = true}) {
    return Row(
      children: [
        Math.tex(
          text,
          mathStyle: MathStyle.display,
          textStyle: TextStyle(fontSize: smallText),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }

  Row createEquasion2(double smallText, String text1, String text2) {
    return Row(
      children: [
        Math.tex(
          text1,
          mathStyle: MathStyle.display,
          textStyle: TextStyle(fontSize: smallText),
        ),
        const Text(" from "),
        Math.tex(
          text2,
          mathStyle: MathStyle.display,
          textStyle: TextStyle(fontSize: smallText),
        ),
        const Text(" is "),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _id = 0;
    Size size = MediaQuery.of(context).size;
    final smallText = size.width / 28;
    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            //top: size.height / 30,
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
                    height: size.height / 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Solve:",
                            style: TextStyle(
                              fontSize: size.width / 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: size.width / 2,
                            margin: EdgeInsets.only(
                              left: size.width / 20,
                            ),
                            child: Column(
                              children: [
                                equasion(
                                  createEquasion(smallText, r"235 + 487 = "),
                                  size,
                                ),
                                equasion(
                                  createEquasion(smallText, r"789 - 324 = "),
                                  size,
                                ),
                                equasion(
                                  createEquasion(smallText, r"25 \cdot 3.6 = "),
                                  size,
                                ),
                                equasion(
                                  createEquasion(smallText, r"\frac{72}{8} = "),
                                  size,
                                ),
                                equasion(
                                  createEquasion2(smallText, r"15\%", r"480"),
                                  size,
                                ),
                                equasion(
                                  createEquasion(smallText, r"\sqrt{144} = "),
                                  size,
                                ),
                                equasion(
                                  createEquasion2(smallText, r"30\%", r"450"),
                                  size,
                                ),
                                equasion(
                                  createEquasion(
                                    smallText,
                                    r"\frac{7}{8} + \frac{3}{4} = ",
                                  ),
                                  size,
                                ),
                                equasion(
                                  createEquasion(smallText, r"9^2 = "),
                                  size,
                                ),
                                equasion(
                                  createEquasion2(
                                    smallText,
                                    r"\frac{2}{5}",
                                    r"2000",
                                  ),
                                  size,
                                ),
                                SizedBox(
                                  height: size.height / 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.timer,
                            size: 0.08 * size.width,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            "${_remainingTime.toString()}s",
                            style: TextStyle(fontSize: size.width / 20),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: size.height / 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "Find x:",
                    style: TextStyle(
                      fontSize: size.width / 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: size.width / 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("11.   "),
                            Math.tex(
                              r"3x - 7 = 14",
                              mathStyle: MathStyle.display,
                              textStyle: TextStyle(fontSize: smallText),
                            ),
                          ],
                        ),
                        equasion(
                          createEquasion(smallText, r"x = "),
                          size,
                          isId: false,
                        ),
                        Row(
                          children: [
                            const Text("12.   "),
                            Math.tex(
                              r"2x + 5 = 17",
                              mathStyle: MathStyle.display,
                              textStyle: TextStyle(fontSize: smallText),
                            ),
                          ],
                        ),
                        equasion(
                          createEquasion(smallText, r"x = "),
                          size,
                          isId: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 25,
              ),
              RedirectButton(
                onClick: () {
                  Navigator.pop(context);
                  _timer.cancel();
                  score = countScore();
                },
                route: (widget.initialTest)
                    ? ShowScore(
                        title: "ATTENTION",
                        description: "Exercise 3 - Strong Concentration",
                        exercise: 3,
                        yourScore: score,
                        maximum: 10,
                        page: const Login1(),
                      )
                    : ProgressScreen(
                        name: "strong_concentration",
                        score: score,
                      ),
                text: 'Continue',
                width: size.width,
              ),
              SizedBox(
                height: size.height / 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
