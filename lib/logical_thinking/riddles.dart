import 'package:brain_train_app/improvement_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import '/progress_screen.dart';
import '/show_score.dart';
import 'package:brain_train_app/buttons.dart';

import 'dart:async';
import 'dart:math';

class RiddlesTest extends StatefulWidget {
  const RiddlesTest({
    super.key,
    required this.exerciseId,
    this.initialTest = false,
  });

  final bool initialTest;
  final int exerciseId;

  @override
  State<RiddlesTest> createState() => _RiddlesTest();
}

class _RiddlesTest extends State<RiddlesTest> {
  double score = 0;
  String languageLevel = "";
  int selectedOption = -1, questionIndex = 0;
  List<int> correctAnswers = [];
  List<String> questions = [];
  List<List<String>> answers = [];

  @override
  void initState() {
    super.initState();
    readData();
    super.initState();
    _remainingTime = 480;

    initMemory();
  }

  void readData() async {
    try {
      List<String> newQuestions = [];
      List<int> newCorrectAnswers = [];
      List<List<String>> newAnswers = [];
      final file =
          await rootBundle.loadString('assets/logical_thinking/riddles.yaml');
      final tasks = loadYaml(file)["questions"]["3points"];
      print(tasks);
      for (var i = 0; i < tasks.length; i++) {
        newQuestions.add(tasks[i]["question"]);
        print('xd');
        print(tasks[i]);

        newCorrectAnswers.add(tasks[i]["correct_answer"]);

        newAnswers.add([]);
        for (var answer in tasks[i]["answers"]) {
          newAnswers[newAnswers.length - 1].add(answer.toString());
        }
      }

      setState(() {
        correctAnswers = newCorrectAnswers;
        questions = newQuestions;
        answers = newAnswers;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  int _remainingTime = 2137;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
      } else {
        setState(() {
          if (_remainingTime > 0) {
            _remainingTime--;
          } else {
            _timer.cancel();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowScore(
                  title: "riddles",
                  description: "Exercise 1 - Short Term Concentration",
                  exercise: 1,
                  yourScore: score,
                  maximum: 10,
                  page: const ImprovementSelection(),
                ),
              ),
            );
          }
        });
      }
    });
  }

  Future<void> initMemory() async {
    setState(() {});
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ListTile createListTitle(int val, String text) {
      return ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: 0.02 * size.height),
        ),
        leading: Radio<int>(
          value: val,
          groupValue: selectedOption,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
      );
    }

    return questions.isEmpty & answers.isEmpty & correctAnswers.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  left: size.width / 15,
                  right: size.width / 15,
                  top: size.height / 15,
                  bottom: size.height / 15,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  "LOGICAL",
                                  style:
                                      TextStyle(fontSize: 0.08 * size.height),
                                ),
                                Text(
                                  "THINKING",
                                  style:
                                      TextStyle(fontSize: 0.035 * size.height),
                                ),
                                SizedBox(height: 0.02 * size.height),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Exercise 2 -  Math riddles",
                                      style: TextStyle(
                                        fontSize: 0.043 * size.width,
                                      ),
                                    ),
                                    SizedBox(width: 0.05 * size.width),
                                    Icon(
                                      Icons.timer,
                                      size: 0.08 * min(size.width, size.height),
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "${_remainingTime.toString()}s",
                                      style: TextStyle(
                                        fontSize: 0.02 * size.height,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 0.05 * size.height),
                          Text(
                            questions[questionIndex],
                            style: TextStyle(fontSize: 0.02 * size.height),
                          ),
                          SizedBox(height: 0.02 * size.height),
                          for (int i = 0;
                              i < answers[questionIndex].length;
                              i++)
                            createListTitle(i, answers[questionIndex][i]),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 0.04 * size.height),
                          SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.75,
                            child: RedirectButton(
                              onClick: () {
                                if (selectedOption == -1) return;

                                if (selectedOption ==
                                    correctAnswers[questionIndex]) {
                                  score += 1;
                                }

                                if (questionIndex < questions.length - 1) {
                                  setState(() {
                                    questionIndex += 1;
                                    selectedOption = -1;
                                    print(questionIndex);
                                    print(answers.join("\n"));
                                  });
                                  return;
                                }

                                Navigator.pop(context);

                                if (widget.initialTest) {
                                  _timer.cancel();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShowScore(
                                        title: "riddles",
                                        description:
                                            "Exercise 1 - Short Term Concentration",
                                        exercise: 1,
                                        yourScore: score,
                                        maximum: 10,
                                        page: const ImprovementSelection(),
                                      ),
                                    ),
                                  );
                                } else {
                                  _timer.cancel();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProgressScreen(
                                        name: "long_term_concentration",
                                        score: score,
                                      ),
                                    ),
                                  );
                                }
                              },
                              text: 'Continue',
                              width: size.width,
                            ),
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
