import 'package:brain_train_app/buttons.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../score_n_progress/show_score.dart';
import '../working_memory.dart';
import '../../score_n_progress/progress_screen.dart';
import '../../score_n_progress/show_improvement.dart';
import 'dart:async';
import '../../app_bar.dart';

class MemoryQuiz extends StatefulWidget {
  final List<Map<String, String>> picked;
  final int score;
  final bool initialTest;
  final bool endingTest;

  const MemoryQuiz(
    this.picked,
    this.score, {
    super.key,
    this.initialTest = false,
    this.endingTest = false,
  });

  @override
  State<MemoryQuiz> createState() => _MemoryQuizState();
}

class _MemoryQuizState extends State<MemoryQuiz> {
  List<Map<String, String>> picked = [];
  int score = 0;
  List<String> defs = [];
  int? selectedOption;
  int questionIndex = 0;
  String word = "";
  String definition = "";
  late Timer _timer;
  int _time = 60;

  bool check(int selected) {
    return (defs[selected] == definition);
  }

  void handleContinue() {
    if (check(selectedOption!)) {
      ++score;
    }
    if (questionIndex < 3) {
      if (selectedOption != null) {
        setState(
          () {
            selectedOption = null;
            questionIndex++;
            loadQuestion();
          },
        );
      }
    } else {
      Navigator.pop(context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => (widget.initialTest)
              ? ShowScore(
                  title: "MEMORY",
                  description: "Exercise 1 - Learning",
                  exercise: 1,
                  yourScore: score.toDouble(),
                  maximum: 14,
                  page: const WorkingMemory(initialTest: true),
                )
              : (widget.endingTest
                  ? ShowImprovement(
                      title: "MEMORY",
                      description: "Exercise 1 - Learning",
                      exercise: 1,
                      yourScore: score.toDouble(),
                      maximum: 14,
                      page: const WorkingMemory(endingTest: true),
                    )
                  : ProgressScreen(
                      name: "learning_words",
                      score: score.toDouble(),
                      exercise: 'Memory',
                    )),
        ),
      );
    }
  }

  void loadQuestion() {
    List<String> defs2 = [];
    for (int i = 0; i < picked.length - 1; ++i) {
      defs2.add(picked[i].values.toList().first);
    }
    var element = picked[questionIndex];
    word = element.keys.toList().first;
    definition = element.values.toList().first;
    picked.removeAt(questionIndex);
    defs2.removeAt(questionIndex);
    defs = [definition];

    final random = Random();
    for (int i = 0; i < 3; ++i) {
      int idx = random.nextInt(defs2.length);
      var element = defs2[idx];
      defs2.removeAt(idx);
      defs.add(element);
    }
    defs.shuffle();
  }

  Widget createDot(
    BuildContext context,
    int usersAnswer,
    int indx,
  ) {
    Size size = MediaQuery.of(context).size;
    return (selectedOption == indx || defs[indx] == definition)
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 30,
            ),
            child: Icon(
              defs[indx] == definition ? Icons.check_circle : Icons.cancel,
              color: defs[indx] == definition ? Colors.green : Colors.red,
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 30,
            ),
            child: const Icon(Icons.circle_outlined),
          );
  }

  ListTile createListTitle(int indx) {
    return ListTile(
      title: Text(defs[indx]),
      leading: selectedOption == null
          ? Radio<int>(
              value: indx,
              groupValue: selectedOption,
              activeColor: Theme.of(context).colorScheme.primary,
              fillColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary,
              ),
              splashRadius: 25,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            )
          : createDot(
              context,
              selectedOption!,
              indx,
            ),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            _time--;
            if (_time <= 0) {
              if (selectedOption != null && check(selectedOption!)) {
                ++score;
              }
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (widget.initialTest)
                      ? ShowScore(
                          title: "MEMORY",
                          description: "Exercise 1 - Learning",
                          exercise: 1,
                          yourScore: score.toDouble(),
                          maximum: 14,
                          page: const WorkingMemory(initialTest: true),
                        )
                      : (widget.endingTest
                          ? ShowImprovement(
                              title: "MEMORY",
                              description: "Exercise 1 - Learning",
                              exercise: 1,
                              yourScore: score.toDouble(),
                              maximum: 14,
                              page: const WorkingMemory(endingTest: true),
                            )
                          : ProgressScreen(
                              name: "learning_words",
                              score: score.toDouble(),
                              exercise: 'Memory',
                            )),
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    picked = widget.picked;
    score = widget.score;

    super.initState();
    loadQuestion();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          margin: EdgeInsets.only(
            bottom: size.width / 10,
            left: size.height / 20,
            right: size.height / 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "MEMORY",
                      style: TextStyle(fontSize: 0.08 * size.height),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.02 * size.height),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Exercise 1.2 - Learning",
                          style: TextStyle(fontSize: 0.025 * size.height),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 0.02 * size.height),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.02 * size.height),
                  Row(
                    children: [
                      Text(
                        "Choose the definition.",
                        style: TextStyle(fontSize: 0.02 * size.height),
                      ),
                      const Spacer(),
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
                  SizedBox(height: 0.02 * size.height),
                  Container(
                    height: 0.04 * size.height,
                    width: 0.8 * size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                    child: Center(
                      child: Text(
                        word,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.03 * size.height),
                  createListTitle(0),
                  createListTitle(1),
                  createListTitle(2),
                  createListTitle(3),
                ],
              ),
              SizedBox(height: 0.05 * size.height),
              SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  onClick: handleContinue,
                  text: 'Continue',
                  width: size.width,
                  requirement: selectedOption != null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
