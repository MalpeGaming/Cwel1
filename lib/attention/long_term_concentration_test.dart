import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'strong_concentration_desc.dart';
import 'package:yaml/yaml.dart';
import '/progress_screen.dart';
import '/show_score.dart';

class LongTermConcentrationTest extends StatefulWidget {
  const LongTermConcentrationTest({
    super.key,
    required this.exerciseId,
    this.initialTest = false,
  });

  final bool initialTest;
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
                height: size.height * 0.9,
                margin: EdgeInsets.only(
                  left: size.width / 20,
                  right: size.width / 20,
                  top: size.height / 15,
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
                          color: const Color.fromARGB(255, 20, 16, 250),
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
                        for (int i = 0; i < answers[questionIndex].length; i++)
                          createListTitle(i, answers[questionIndex][i]),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.05,
                          width: size.width * 0.75,
                          child: FloatingActionButton.extended(
                            onPressed: () {
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
                                    ),
                                  ),
                                );
                              }
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
