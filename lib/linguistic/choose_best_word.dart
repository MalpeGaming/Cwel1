import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import 'dart:async';
import 'dart:math';
import '/app_bar.dart';
import '../score_n_progress/progress_screen.dart';
import '/buttons.dart';
import '../create_dot.dart';

class ChooseBestWord extends StatefulWidget {
  const ChooseBestWord({super.key});

  @override
  _ChooseBestWord createState() => _ChooseBestWord();
}

class _ChooseBestWord extends State<ChooseBestWord> {
  double score = 0;
  int round = 0;
  int _remainingTime = 60;
  int? selectedOption;

  late Size size;
  late Timer _timer;
  late int questionId;
  late List<int> correctAnswers;
  late List<String> questions;
  late List<List<String>> answers;

  ListTile createListTitle(int val, String text) {
    return ListTile(
      dense: true,
      title: Text(
        text,
        style: TextStyle(fontSize: 0.02 * size.height),
      ),
      leading: (selectedOption == null)
          ? Radio<int>(
              value: val,
              groupValue: selectedOption,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            )
          : createDot(
              context,
              selectedOption!,
              correctAnswers[questionId],
              val,
            ),
    );
  }

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

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProgressScreen(
                    name: "choose_best_word",
                    score: score,
                    exercise: 'ChooseBestWord',
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  void readData() async {
    try {
      List<int> newCorrectAnswers = [];
      List<String> newQuestions = [];
      List<List<String>> newAnswers = [];

      final file =
          await rootBundle.loadString('assets/linguistic/choose_best_word.yml');
      final tests = loadYaml(file)["tests"];

      for (int i = 0; i < tests.length; i++) {
        newCorrectAnswers.add(tests[i]["correct_answer"]);
        newQuestions.add(tests[i]["question"]);
        newAnswers.add(tests[i]["answers"].cast<String>());
      }

      setState(() {
        questions = newQuestions;
        answers = newAnswers;
        correctAnswers = newCorrectAnswers;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 50,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose best word.",
                          style: TextStyle(
                            fontSize: size.width / 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height / 40),
                        round == 0
                            ? const SizedBox()
                            : Column(
                                children: [
                                  Icon(
                                    Icons.access_time_filled_sharp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: size.width / 12,
                                  ),
                                  Text(
                                    "$_remainingTime s",
                                    style: TextStyle(
                                      fontSize: size.width / 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: size.width / 13,
                                    height: size.width / 13,
                                    //padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "$score",
                                        style: TextStyle(
                                          fontSize: size.width / 30,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height / 40),
                                ],
                              ),
                      ],
                    ),
                    round == 0
                        ? SizedBox(
                            height: size.height / 25,
                          )
                        : const SizedBox(),
                    round == 0
                        ? Text(
                            "In the following exercise you will have 60 seconds to complete as many exercises as you can.\n\nFor each correctly completed exercise you will get 1 point and for each mistake you will lose 0.5 points.\n\nClick “Continue” when you are ready.",
                            style: TextStyle(
                              fontSize: size.width / 24,
                            ),
                          )
                        : Column(
                            children: [
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .shadow
                                            .withOpacity(1),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  width: size.width * 0.8,
                                  child: Container(
                                    margin: const EdgeInsets.all(15),
                                    child: Center(
                                      child: Text(
                                        questions[questionId],
                                        style: TextStyle(
                                          fontSize: size.width / 22,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height / 30,
                              ),
                              createListTitle(0, answers[questionId][0]),
                              createListTitle(1, answers[questionId][1]),
                              createListTitle(2, answers[questionId][2]),
                              createListTitle(3, answers[questionId][3]),
                            ],
                          ),
                  ],
                ),
                if (round == 0)
                  SizedBox(height: size.height / 5)
                else
                  SizedBox(height: size.height / 20),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.75,
                        child: RedirectButton(
                          onClick: () {
                            if (round == 0) {
                              startTimer();
                            } else if (selectedOption ==
                                correctAnswers[questionId]) {
                              score += 1;
                            } else {
                              score -= 0.5;
                            }

                            setState(() {
                              round++;
                              questionId = Random().nextInt(answers.length);
                              selectedOption = null;
                            });
                          },
                          text: "Continue",
                          width: size.width * 0.75,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
