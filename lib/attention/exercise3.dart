import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../show_score.dart';
import '../improvement_selection.dart';
import 'exercise2.dart';

class ThirdAttentionExercise extends StatefulWidget {
  const ThirdAttentionExercise({super.key});

  @override
  State<ThirdAttentionExercise> createState() => _ThirdAttentionExercise();
}

class _ThirdAttentionExercise extends State<ThirdAttentionExercise> {
  int _id = 0;
  int _remainingTime = 130;
  late Timer _timer;
  List<double> correctAnswers = [
    732,
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
    6
  ];
  List<double> userAnswers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  Future<void> startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShowScore(
                title: "ATTENTION",
                description: "Exercise 3 - Strong Concentration",
                exercise: 3,
                yourScore: 3,
                maximum: 10,
                page: SecondAttentionExercise(),
              ),
            ),
          );
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Column equasion(Row text, Size size, {bool isId = true}) {
    _id++;
    final thisId = _id;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        isId
            ? Text("$thisId.   ")
            : const SizedBox(
                height: 0,
                width: 0,
              ),
        text,
        SizedBox(
            width: size.width / 6,
            height: size.height / 36,
            child: TextField(
              style: TextStyle(fontSize: size.width / 30),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"[\d.]")),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  String text = newValue.text;
                  if (text.isNotEmpty) {
                    userAnswers[thisId - 1] = double.parse(text);
                  }
                  return newValue;
                }),
              ],
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )),
      ]),
      SizedBox(
        height: size.height / 50,
      )
    ]);
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

  @override
  Widget build(BuildContext context) {
    _id = 0;
    Size size = MediaQuery.of(context).size;
    final smallText = size.width / 28;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.98,
          margin: EdgeInsets.only(
              left: size.width / 10,
              right: size.width / 10,
              top: size.height / 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text("ATTENTION",
                          style: TextStyle(
                            fontSize: size.width / 8,
                          ),
                          textAlign: TextAlign.center),
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
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: size.width / 2,
                                  margin: EdgeInsets.only(
                                    left: size.width / 20,
                                  ),
                                  child: Column(children: [
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"235 + 487 = ",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          )
                                        ]),
                                        size),
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"789 - 324 = ",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          )
                                        ]),
                                        size),
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"25 \cdot 3.6 = ",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          )
                                        ]),
                                        size),
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"\frac{72}{8} = ",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          )
                                        ]),
                                        size),
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"15\%",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const Text(" from "),
                                          Math.tex(
                                            r"480",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const Text(" is ")
                                        ]),
                                        size),
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"\sqrt{144} = ",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          )
                                        ]),
                                        size),
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"30\%",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const Text(" from "),
                                          Math.tex(
                                            r"450",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const Text(" is ")
                                        ]),
                                        size),
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"\frac{7}{8} + \frac{3}{4} = ",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          )
                                        ]),
                                        size),
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"9^2 = ",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          )
                                        ]),
                                        size),
                                    equasion(
                                        Row(children: [
                                          Math.tex(
                                            r"\frac{2}{5}",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const Text(" from "),
                                          Math.tex(
                                            r"2000",
                                            mathStyle: MathStyle.display,
                                            textStyle:
                                                TextStyle(fontSize: smallText),
                                          ),
                                          const Text(" is ")
                                        ]),
                                        size),
                                    SizedBox(
                                      height: size.height / 50,
                                    ),
                                  ]),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 0.08 * size.width,
                                  color: Colors.blue[400],
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
                              ]),
                        ]),
                    Text(
                      "Find x:",
                      style: TextStyle(
                          fontSize: size.width / 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: size.width / 20,
                      ),
                      child: Column(children: [
                        Row(children: [
                          const Text("11.   "),
                          Math.tex(
                            r"3x - 7 = 14",
                            mathStyle: MathStyle.display,
                            textStyle: TextStyle(fontSize: smallText),
                          )
                        ]),
                        equasion(
                            Row(children: [
                              Math.tex(
                                r"x = ",
                                mathStyle: MathStyle.display,
                                textStyle: TextStyle(fontSize: smallText),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ]),
                            size,
                            isId: false),
                        Row(children: [
                          const Text("12.   "),
                          Math.tex(
                            r"2x + 5 = 17",
                            mathStyle: MathStyle.display,
                            textStyle: TextStyle(fontSize: smallText),
                          )
                        ]),
                        equasion(
                            Row(children: [
                              Math.tex(
                                r"x = ",
                                mathStyle: MathStyle.display,
                                textStyle: TextStyle(fontSize: smallText),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ]),
                            size,
                            isId: false),
                      ]),
                    )
                  ]),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      _timer.cancel();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowScore(
                            title: "ATTENTION",
                            description: "Exercise 3 - Strong Concentration",
                            exercise: 3,
                            yourScore: countScore(),
                            maximum: 10,
                            page: const ImprovementSelection(),
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
              SizedBox(
                height: size.height / 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
