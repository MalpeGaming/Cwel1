import 'package:brain_train_app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'strong_concentration_desc.dart';
import 'package:yaml/yaml.dart';
import '../score_n_progress/progress_screen.dart';
import '../score_n_progress/show_score.dart';
import '/app_bar.dart';
import '../score_n_progress/show_improvement.dart';

class LongTermConcentrationTest extends StatefulWidget {
  const LongTermConcentrationTest({
    super.key,
    required this.exerciseId,
    this.initialTest = false,
    this.endingTest = false,
  });

  final bool initialTest;
  final bool endingTest;
  final int exerciseId;

  @override
  State<LongTermConcentrationTest> createState() =>
      _LongTermConcentrationTest();
}

class _LongTermConcentrationTest extends State<LongTermConcentrationTest> {
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
  }

  void readData() async {
    try {
      List<String> newQuestions = [];
      List<int> newCorrectAnswers = [];
      List<List<String>> newAnswers = [];

      final file = await rootBundle
          .loadString('assets/attention/long_term_concentration_test.yaml');
      final tasks = loadYaml(file)["tests"][widget.exerciseId]["questions"];

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ListTile createListTitle(int val, String text) {
      return ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: 0.025 * size.height),
        ),
        leading: Radio<int>(
          value: val,
          groupValue: selectedOption,
          activeColor: Theme.of(context).colorScheme.primary,
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
            appBar: appBar(context, ""),
            body: SingleChildScrollView(
              child: Container(
                height: size.height * 0.9,
                margin: EdgeInsets.only(
                  left: size.width / 20,
                  right: size.width / 20,
                ),
                child: SingleChildScrollView(
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
                              "ATTENTION",
                              style: TextStyle(
                                fontSize: size.width / 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Exercise 2 - Long Term Concentration",
                              style: TextStyle(
                                fontSize: size.width / 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 20,
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
                              i < answers[questionIndex].length;
                              i++)
                            createListTitle(i, answers[questionIndex][i]),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 20,
                      ),
                      Column(
                        children: [
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShowScore(
                                        title: "ATTENTION",
                                        description:
                                            "Exercise 2 - Long Term Concentration",
                                        exercise: 2,
                                        yourScore: score,
                                        maximum: 10,
                                        page: const StrongConcentrationDesc(
                                          initialTest: true,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProgressScreen(
                                        name: "long_term_concentration",
                                        score: score,
                                        exercise: "LongTermConcentrationVideo",
                                      ),
                                    ),
                                  );
                                }
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
            ),
          );
  }
}
