import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../lesson9/main.dart';

import '../helper_fn.dart';
import 'questions.dart';

class Lesson8 extends StatefulWidget {
  const Lesson8({super.key});

  @override
  State<Lesson8> createState() => _Lesson8();
}

class _Lesson8 extends State<Lesson8> {
  int selectedOption = -1;

  Widget buildQuizScreen({
    required int questionNumber,
    Widget? image,
  }) {
    List<String> answers = questions[questionNumber]["answers"] as List<String>;
    Size size = MediaQuery.of(context).size;
    ListTile createListTitle(int val, String text, Size size) {
      return ListTile(
        dense: true,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Exercise ${questionNumber + 1}.",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 0.02 * size.height,
          ),
        ),
        Text(
          questions[questionNumber]["question"] as String,
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
        ),
        if (image != null) image,
        SizedBox(height: MediaQuery.of(context).size.height / 70),
        Column(
          children: List.generate(answers.length, (index) {
            return Container(
              child: createListTitle(index, answers[index], size),
            );
          }),
        ),
      ],
    );
  }

  List<int> usersAnswers = List<int>.filled(4, -1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                "Lesson 8",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "Final Key Metrics Quiz",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              createDivider(context),
              buildQuizScreen(
                questionNumber: 0,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 1,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 2,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 3,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 4,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 5,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 6,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 7,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 8,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 9,
              ),
              createDivider(context),
              Text(
                "Would you like to move on to the next lesson or do another quiz? This time it will be harder, expanding on the course content and requiring a bit more thinking - by doing the additional questions you will get extra points.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              createDivider(context),
              buildQuizScreen(
                questionNumber: 10,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 11,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 12,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 13,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 14,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 15,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 16,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 17,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 18,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 19,
              ),
              SizedBox(height: size.height / 20),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    route: const Lesson9(),
                    text: 'Continue',
                    width: size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
