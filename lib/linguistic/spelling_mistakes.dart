import 'package:brain_train_app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import '../score_n_progress/progress_screen.dart';
import 'package:dictionaryx/dictionary_msa_json_flutter.dart';
import 'package:brain_train_app/app_bar.dart';
import '../create_dot.dart';
import 'dart:async';

class SpellingMistakes extends StatefulWidget {
  const SpellingMistakes({
    super.key,
    required this.exerciseId,
  });

  final int exerciseId;

  @override
  State<SpellingMistakes> createState() => _SpellingMistakes();
}

class _SpellingMistakes extends State<SpellingMistakes> {
  int score = 0;
  String languageLevel = "";
  int selectedOption = -1, questionIndex = 0;
  List<String> questions = [];
  List<List<String>> answers = [];
  final dMSAJson = DictionaryMSAFlutter();
  late Timer _timer;
  int _time = 60;

  @override
  void initState() {
    super.initState();
    readData();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            _time--;
            if (_time <= 0) {
              if (selectedOption ==
                  correctAnswers[shuffledNumbers[questionIndex]]) {
                score += 1;
              }

              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProgressScreen(
                    name: "long_term_concentration",
                    score: score.toDouble(),
                    exercise: 'SpellingMistakes',
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  Future<bool> wordExistsInDict(word2) async {
    if (await dMSAJson.hasEntry(word2.toLowerCase())) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> lookupWord(String word) async {
    bool wordExists = true;

    final splitted = word.split(" ");
    for (var word2 in splitted) {
      if (!(await wordExistsInDict(word2))) wordExists = false;
    }
    return wordExists;
  }

  List<int> shuffledNumbers = [];
  List<int> correctAnswers = [];
  Future<void> saveCorrectAnswer(List<String> answers, int questionId) async {
    for (var i = 0; i < answers.length; ++i) {
      if (await lookupWord(answers[i])) {
        correctAnswers[questionId] = i;
        break;
      }
    }
  }

  void readData() async {
    try {
      List<String> newQuestions = [];
      List<List<String>> newAnswers = [];
      final file = await rootBundle
          .loadString('assets/linguistic/spelling_mistakes.yaml');
      final tasks = loadYaml(file)["questions"];

      for (var i = 0; i < tasks.length; i++) {
        newQuestions.add(tasks[i]["question"]);
        newAnswers.add([]);
        for (var answer in tasks[i]["answers"]) {
          newAnswers[newAnswers.length - 1].add(answer.toString());
        }
        correctAnswers.add(-1);
        saveCorrectAnswer(newAnswers[newAnswers.length - 1], i);
      }

      shuffledNumbers = List.generate(newAnswers.length, (index) => index);
      shuffledNumbers.shuffle();

      setState(() {
        questions = newQuestions;
        answers = newAnswers;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ListTile createListTitle(int val, String text) {
      return ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: 0.025 * size.height),
        ),
        dense: true,
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
                correctAnswers[shuffledNumbers[questionIndex]],
                val,
              ),
      );
    }

    return questions.isEmpty & answers.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: appBar(context, ""),
            body: SingleChildScrollView(
              child: Container(
                height: size.height * 0.9,
                margin: EdgeInsets.only(
                  left: size.width / 10,
                  right: size.width / 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "LINGUISTIC",
                            style: TextStyle(
                              fontSize: size.width / 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Exercise 2 - spelling mistakes",
                            style: TextStyle(
                              fontSize: size.width / 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: size.height / 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 0.08 * size.width,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              "${_time.toString()}s",
                              style: TextStyle(fontSize: size.width / 20),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: size.height / 25,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
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
                          width: size.width * 0.9,
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                questions[questionIndex],
                                style: TextStyle(
                                  fontSize: size.width / 20,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 25,
                        ),
                        for (int i = 0;
                            i < answers[shuffledNumbers[questionIndex]].length;
                            i++)
                          createListTitle(
                            i,
                            answers[shuffledNumbers[questionIndex]][i],
                          ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: size.width / 7,
                              width: size.width / 7,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .shadow
                                        .withOpacity(0.7),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  score.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width / 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.width / 20,
                              width: size.width / 20,
                            ),
                            Container(
                              height: size.width / 7,
                              width: size.width / 7,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .shadow
                                        .withOpacity(0.7),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  (questionIndex - score).toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width / 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 20,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                          width: size.width * 0.75,
                          child: RedirectButton(
                            onClick: () {
                              if (selectedOption == -1) return;

                              if (selectedOption ==
                                  correctAnswers[
                                      shuffledNumbers[questionIndex]]) {
                                score += 1;
                              }
                              if (questionIndex < 10) {
                                setState(() {
                                  questionIndex += 1;
                                  selectedOption = -1;
                                });
                                return;
                              }

                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProgressScreen(
                                    name: "long_term_concentration",
                                    score: score.toDouble(),
                                    exercise: 'SpellingMistakes',
                                  ),
                                ),
                              );
                            },
                            text: 'Continue',
                            width: size.width,
                          ),
                        ),
                        SizedBox(
                          height: size.height / 20,
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
