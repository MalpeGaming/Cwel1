import 'package:brain_train_app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import '../score_n_progress/progress_screen.dart';
import '/app_bar.dart';
import '../create_dot.dart';

class Grammar extends StatefulWidget {
  const Grammar({
    super.key,
    required this.exerciseId,
    this.initialTest = false,
    this.endingTest = false,
  });

  final bool initialTest;
  final int exerciseId;
  final bool endingTest;

  @override
  State<Grammar> createState() => _Grammar();
}

class _Grammar extends State<Grammar> {
  double score = 0;
  String languageLevel = "";
  int selectedOption = -1, questionIndex = 0;
  List<int> correctAnswers = [];
  List<String> questions = [];
  List<List<String>> answers = [];
  int correct = 0;
  int incorrect = 0;
  List<int> shuffledNumbers = [];

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
          .loadString('assets/linguistic/grammar_mcq_test.yaml');
      final tasks = loadYaml(file)["questions"];

      for (var i = 0; i < tasks.length; i++) {
        newQuestions.add(tasks[i]["question"]);
        newCorrectAnswers.add(tasks[i]["correct_answer"]);
        newAnswers.add([]);

        for (var answer in tasks[i]["answers"]) {
          newAnswers[newAnswers.length - 1].add(answer.toString());
        }
      }
      shuffledNumbers =
          List.generate(newAnswers.length - 1, (index) => index + 1);
      shuffledNumbers.shuffle();

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
              child: Column(
                children: [
                  Container(
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
                              Text(
                                "Grammar MCQ Test",
                                style: TextStyle(
                                  fontSize: size.width / 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: size.height / 20,
                              ),
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
                                        questions[
                                            shuffledNumbers[questionIndex]],
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
                                height: size.height / 25,
                              ),
                              for (int i = 0;
                                  i <
                                      answers[shuffledNumbers[questionIndex]]
                                          .length;
                                  i++)
                                createListTitle(
                                  i,
                                  answers[shuffledNumbers[questionIndex]][i],
                                ),
                            ],
                          ),
                          SizedBox(height: size.height / 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                    correct.toString(),
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
                                    incorrect.toString(),
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
                          SizedBox(height: size.height / 30),
                          Column(
                            children: [
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
                                      correct += 1;
                                    } else {
                                      incorrect += 1;
                                    }

                                    if (questionIndex < 10) {
                                      setState(() {
                                        questionIndex += 1;
                                        selectedOption = -1;
                                        print(questionIndex);
                                        print(answers.join("\n"));
                                      });
                                      return;
                                    }

                                    Navigator.pop(context);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProgressScreen(
                                          name: "grammar_mcq",
                                          score: score,
                                          exercise: 'Grammar',
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
                ],
              ),
            ),
          );
  }
}
