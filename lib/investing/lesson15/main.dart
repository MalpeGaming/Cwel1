import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../menu.dart';
import '../helper_fn.dart';
import 'questions.dart';

class Lesson15 extends StatefulWidget {
  const Lesson15({super.key});

  @override
  State<Lesson15> createState() => _Lesson15();
}

class _Lesson15 extends State<Lesson15> {
  int selectedOption = -1;

  Widget buildQuizScreen({
    required int questionNumber,
    String? image,
    Widget? imageWidget,
  }) {
    List<String> answers = questions[questionNumber]["answers"] as List<String>;
    ListTile createListTitle(int val, String text, Size size) {
      return ListTile(
        dense: true,
        title: Text(
          text,
          style: TextStyle(fontSize: 0.02 * size.height),
        ),
        leading: (usersAnswers[questionNumber] == -1)
            ? Radio<int>(
                value: val,
                groupValue: usersAnswers[questionNumber],
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    usersAnswers[questionNumber] = value!;
                  });
                },
              )
            : createDot(
                context,
                usersAnswers[questionNumber],
                questions[questionNumber]["correctAnswer"]!,
                val,
              ),
      );
    }

    return createExercise(
      context,
      questionNumber,
      questions[questionNumber]["question"] as String,
      answers,
      image,
      imageWidget,
      createListTitle,
      (questions[questionNumber]["explanation"] != null &&
              usersAnswers[questionNumber] != -1)
          ? questions[questionNumber]["explanation"] as String
          : null,
    );
  }

  List<int> usersAnswers = List<int>.filled(questions.length, -1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: size.width / 10,
              right: size.width / 10,
              top: size.height / 15,
              bottom: size.height / 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lesson 15",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Practical Analysis of Bonds",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                createDivider(context),
                zoomImage("assets/investing/lesson15/1.png"),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 4,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 6,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 7,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 8,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 9,
                ),
                SizedBox(height: size.height / 10),
                Center(
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: RedirectButton(
                      //route: const Lesson2(),
                      onClick: () {
                        int score = 0;
                        for (int i = 0; i < usersAnswers.length; i++) {
                          if (usersAnswers[i] ==
                              questions[i]["correctAnswer"]) {
                            score++;
                          }
                        }
                        print("wynik:");
                        print(score);
                        saveResult(12, score);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InvestingMenu(),
                          ),
                        );
                      },
                      text: 'Continue',
                      width: size.width,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
