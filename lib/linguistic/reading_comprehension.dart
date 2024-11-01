import 'package:flutter/material.dart';
import '../app_bar.dart';
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import '../investing/helper_fn.dart';
import '../buttons.dart';
import '../score_n_progress/show_score.dart';
import '../score_n_progress/progress_screen.dart';
import '/home.dart';
import '../score_n_progress/show_improvement.dart';
import '../title_page.dart';

class ReadingComprehension extends StatefulWidget {
  const ReadingComprehension({
    super.key,
    this.initialTest = false,
    this.endingTest = false,
  });

  final bool initialTest;
  final bool endingTest;

  @override
  State<ReadingComprehension> createState() => _ReadingComprehension();
}

class _ReadingComprehension extends State<ReadingComprehension> {
  List<String> questions = [];
  List<int> correct = [];
  List<int> usersAnswers = [];
  List<List<String>> answers = [];
  String title = "";
  String author = "";
  String text = "";
  var rng = Random();
  int selectedOption = -1;

  Widget createExercise(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return Center(
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
              color: Theme.of(context).colorScheme.shadow.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        width: size.width * 0.7,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              questions[index],
              style: TextStyle(
                fontSize: size.width / 22,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  ListTile createListTitle(
    BuildContext context,
    int index,
    int val,
    String text,
  ) {
    Size size = MediaQuery.of(context).size;

    return ListTile(
      title: Text(
        text,
        style: TextStyle(fontSize: 0.02 * size.height),
      ),
      leading: (usersAnswers[index] == -1)
          ? Radio<int>(
              value: val,
              groupValue: usersAnswers[index],
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  usersAnswers[index] = value!;
                });
              },
            )
          : createDot(
              context,
              usersAnswers[index],
              correct[index],
              val,
            ),
    );
  }

  void readData() async {
    try {
      List<String> newQuestions = [];
      List<int> newCorrect = [];
      List<List<String>> newAnswers = [];
      int test = rng.nextInt(11);

      final file = await rootBundle
          .loadString('assets/linguistic/reading_comprehension.yaml');
      final tasks = loadYaml(file)["tests"][test];
      print(tasks[0]["questions"]);
      for (var i = 0; i < tasks[0]["questions"].length; i++) {
        newQuestions.add(tasks[0]["questions"][i]["question"]);
        newCorrect.add(tasks[0]["questions"][i]["correct_answer"]);

        newAnswers.add([]);
        for (var answer in tasks[0]["questions"][i]["answers"]) {
          newAnswers[newAnswers.length - 1].add(answer.toString());
        }
      }

      setState(() {
        questions = newQuestions;
        correct = newCorrect;
        answers = newAnswers;
        title = tasks[0]["title"];
        author = tasks[0]["author"];
        text = tasks[0]["text"];
        usersAnswers = List<int>.filled(questions.length, -1);
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Widget createQuestion(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        createExercise(context, index),
        SizedBox(height: size.height / 30),
        for (int i = 0; i < answers[0].length; i++)
          createListTitle(
            context,
            index,
            i,
            answers[index][i],
          ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return questions.isEmpty && answers.isEmpty && correct.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: appBar(context, ""),
            body: Container(
              width: size.width * 0.9,
              height: size.height * 0.9,
              margin: EdgeInsets.only(
                left: size.width / 10,
                right: size.width / 10,
              ),
              child: RawScrollbar(
                thumbColor: Theme.of(context).colorScheme.primary,
                radius: const Radius.circular(20),
                thickness: 5,
                child: SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title.toString(),
                            style: TextStyle(
                              fontSize: size.width / 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "by $author",
                            style: TextStyle(fontSize: size.width / 30),
                          ),
                          SizedBox(
                            height: size.height / 30,
                          ),
                          Text(
                            text,
                            style: TextStyle(fontSize: size.height / 50),
                          ),
                          for (int i = 0; i < questions.length; i++)
                            Column(
                              children: [
                                createDivider(context),
                                createQuestion(context, i),
                              ],
                            ),
                        ],
                      ),
                      SizedBox(height: size.height / 10),
                      Center(
                        child: SizedBox(
                          height: size.height * 0.05,
                          width: size.width * 0.75,
                          child: RedirectButton(
                            text: 'Continue',
                            width: size.width,
                            onClick: () {
                              int score = 0;
                              for (int i = 0; i < usersAnswers.length; i++) {
                                if (usersAnswers[i] == correct[i]) {
                                  score++;
                                }
                              }
                              Navigator.pop(context);

                              if (widget.initialTest) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowScore(
                                      title: "LINGUISTIC",
                                      description:
                                          "Exercise 2 -  Reading Comprehension",
                                      exercise: 2,
                                      yourScore: score.toDouble(),
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
                                      title: "LINGUISTIC",
                                      description:
                                          "Exercise 2 -  Reading Comprehension",
                                      exercise: 2,
                                      yourScore: score.toDouble(),
                                      maximum: 10,
                                      page: const TitlePage(
                                        title: 'BrainAce.pro',
                                      ),
                                      lastin: true,
                                    ),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProgressScreen(
                                      name: "reading_comprehension",
                                      score: score.toDouble(),
                                      exercise: 'ReadingComprehension',
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: size.height / 10),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
