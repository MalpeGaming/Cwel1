import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import 'dart:async';
import 'dart:math';
import '../score_n_progress/progress_screen.dart';
import '/buttons.dart';
import 'package:brain_train_app/app_bar.dart';

class CorrectAWord extends StatefulWidget {
  const CorrectAWord({super.key});

  @override
  _CorrectAWord createState() => _CorrectAWord();
}

class _CorrectAWord extends State<CorrectAWord> {
  double score = 0;
  int round = 0;
  int _remainingTime = 60;
  final _controller = TextEditingController();

  late Timer _timer;
  late int wordIndex;
  late String incorrectWord;
  late String correctWord;
  late List<String> correctWords = [];
  late List<String> incorrectWords = [];

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
                    name: "correct_a_word",
                    score: score,
                    exercise: 'CorrectAWord',
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
      List<String> newCorrectWords = [];
      List<String> newIncorrectWords = [];

      final file =
          await rootBundle.loadString('assets/linguistic/correct_a_word.yml');
      final newCorrectWordsYaml = loadYaml(file)["words"][0]["correct"];
      final newIncorrectWordsYaml = loadYaml(file)["words"][1]["incorrect"];

      for (int i = 0; i < newCorrectWordsYaml.length; i++) {
        newCorrectWords.add(newCorrectWordsYaml[i].toString());
        newIncorrectWords.add(newIncorrectWordsYaml[i].toString());
      }

      setState(() {
        correctWords = newCorrectWords;
        incorrectWords = newIncorrectWords;
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
    Size size = MediaQuery.of(context).size;
    return correctWords.isEmpty && incorrectWords.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: appBar(context, ""),
            body: SingleChildScrollView(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.9,
                margin: EdgeInsets.only(
                  left: size.width / 10,
                  right: size.width / 10,
                  top: size.height / 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              children: [
                                TextSpan(
                                  text: "LINGUISTIC\n",
                                  style: TextStyle(
                                    fontSize: size.width / 8,
                                  ),
                                ),
                                TextSpan(
                                  text: "INTELLIGENCE",
                                  style: TextStyle(
                                    fontSize: size.width / 16,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: size.height / 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Exercise 1 - Correct a word",
                              style: TextStyle(fontSize: size.width / 20),
                            ),
                            round == 0
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      Icon(
                                        Icons.access_time_filled_sharp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: size.width / 10,
                                      ),
                                      Text(
                                        "$_remainingTime s",
                                        style: TextStyle(
                                          fontSize: size.width / 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        width: size.width / 10,
                                        height: size.width / 10,
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
                                "In the following exercise you will have 60 seconds to correct as many misspelled words as you can.\n\nFor each correctly completed exercise you will get 1 point and for each mistake you will lose 0.5 points.\n\nClick “Continue” when you are ready.",
                                style: TextStyle(
                                  fontSize: size.width / 24,
                                ),
                              )
                            : Column(
                                children: [
                                  Text(
                                    incorrectWord,
                                    style: TextStyle(
                                      fontSize: size.width / 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height / 30,
                                  ),
                                  Text(
                                    "Write the correct version of word above. It may be already correct, in that case write the same word.",
                                    style: TextStyle(
                                      fontSize: size.width / 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height / 30,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: incorrectWord,
                                    ),
                                    controller: _controller,
                                  ),
                                ],
                              ),
                      ],
                    ),
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
                                } else if (_controller.text.trim() ==
                                    correctWord) {
                                  score += 1;
                                } else {
                                  score -= 0.5;
                                }

                                wordIndex =
                                    Random().nextInt(correctWords.length);

                                setState(() {
                                  round++;
                                  correctWord = correctWords[wordIndex];
                                  incorrectWord = incorrectWords[wordIndex];
                                  _controller.clear();
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
          );
  }
}
