import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import '../score_n_progress/progress_screen.dart';
import '../score_n_progress/show_score.dart';
import 'package:brain_train_app/buttons.dart';
import 'dart:async';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import '/home.dart';
import '../app_bar.dart';
import '../score_n_progress/show_improvement.dart';
import '../title_page.dart';
import '../create_dot.dart';

class RiddlesTest extends StatefulWidget {
  const RiddlesTest({
    super.key,
    this.initialTest = false,
    this.endingTest = false,
  });

  final bool initialTest;
  final bool endingTest;

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
  int numberOfQuestions = 0;
  int difficulty = 3;
  int passed = 0;
  late SharedPreferences prefs;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    if ((prefs.getInt('riddles_difficulty')) != null) {
      difficulty = prefs.getInt('riddles_difficulty')!;
    }
    readData();

    numberOfQuestions = (difficulty == 3 ? 25 : (difficulty == 4 ? 25 : 23));
    questionIndex = Random().nextInt(numberOfQuestions);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
    startTimer();
  }

  void readData() async {
    try {
      List<String> newQuestions = [];
      List<int> newCorrectAnswers = [];
      List<List<String>> newAnswers = [];
      final file =
          await rootBundle.loadString('assets/logical_thinking/riddles.yaml');
      final tasks = loadYaml(file)["questions"]["${difficulty}points"];
      for (var i = 0; i < tasks.length; i++) {
        newQuestions.add(tasks[i]["question"]);

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

  int _remainingTime = 480;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          Navigator.pop(context);

          if (widget.initialTest) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowScore(
                  title: "Riddles",
                  description: "Exercise 1 - Short Term Concentration",
                  exercise: 1,
                  yourScore: score,
                  maximum: 10,
                  page: const Home(),
                  clearAllWindows: true,
                ),
              ),
            );
          } else if (widget.endingTest) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowImprovement(
                  title: "Riddles",
                  description: "Exercise 1 - Short Term Concentration",
                  exercise: 1,
                  yourScore: score,
                  maximum: 10,
                  page: const TitlePage(
                    title: 'BrainAce.pro',
                  ),
                  lastin: true,
                ),
              ),
            );
          } else {
            write((score.toInt() == 10) ? 1 : 0);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProgressScreen(
                  name: "long_term_concentration",
                  score: score,
                  exercise: 'Riddles',
                ),
              ),
            );
          }
        }
      });
    });
  }

  Future<void> write(int add) async {
    prefs = await SharedPreferences.getInstance();
    if ((prefs.getInt('riddles_streak')) == null) {
      await prefs.setInt('riddles_streak', 0);
    }
    await prefs.setInt(
      'riddles_streak',
      prefs.getInt('riddles_streak')! + add,
    );
    if ((prefs.getInt('riddles_difficulty')) == null) {
      await prefs.setInt('riddles_difficulty', 3);
    }
    if ((prefs.getInt('riddles_streak')!) >= 6 &&
        (prefs.getInt('riddles_difficulty')!) < 5) {
      await prefs.setInt(
        'riddles_difficulty',
        prefs.getInt('riddles_difficulty')! + 1,
      );
      await prefs.setInt('riddles_streak', 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ListTile createListTitle(int val, String text) {
      return ListTile(
        dense: true,
        title: Text(
          text,
          style: TextStyle(fontSize: 0.02 * size.height),
        ),
        leading: (selectedOption == -1)
            ? Radio<int>(
                value: val,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              )
            : createDot(
                context,
                selectedOption,
                correctAnswers[questionIndex],
                val,
              ),
      );
    }

    return questions.isEmpty & answers.isEmpty & correctAnswers.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: appBar(context, ""),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  left: size.width / 15,
                  right: size.width / 15,
                  bottom: size.height / 20,
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
                                      TextStyle(fontSize: 0.07 * size.height),
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
                                  score += 5;
                                } else {
                                  score -= 2;
                                }

                                if (passed < 1 ||
                                    widget.initialTest ||
                                    widget.endingTest) {
                                  passed += 1;
                                  setState(() {
                                    questionIndex =
                                        Random().nextInt(numberOfQuestions);
                                    selectedOption = -1;
                                  });
                                  return;
                                }
                                write((score.toInt() == 10) ? 1 : 0);
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProgressScreen(
                                      name: "long_term_concentration",
                                      score: score,
                                      exercise: 'Riddles',
                                    ),
                                  ),
                                );
                              },
                              text: 'Continue',
                              width: size.width,
                            ),
                          ),
                        ],
                      ),
                      if (widget.initialTest || widget.endingTest)
                        Column(
                          children: [
                            SizedBox(height: 0.1 * size.height),
                            SizedBox(
                              height: size.height * 0.05,
                              width: size.width * 0.75,
                              child: RedirectButton(
                                onClick: () {
                                  Navigator.pop(context);
                                  if (widget.initialTest) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShowScore(
                                          title: "Riddles",
                                          description:
                                              "Exercise 1 - Short Term Concentration",
                                          exercise: 1,
                                          yourScore: score,
                                          maximum: 10,
                                          page: const Home(),
                                          clearAllWindows: true,
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShowImprovement(
                                          title: "Riddles",
                                          description:
                                              "Exercise 1 - Short Term Concentration",
                                          exercise: 1,
                                          yourScore: score,
                                          maximum: 10,
                                          page: const TitlePage(
                                            title: 'BrainAce.pro',
                                          ),
                                          lastin: true,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                text: "End session",
                                width: size.width * 0.75,
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
