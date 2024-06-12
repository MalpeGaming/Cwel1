import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';

class Lesson2 extends StatefulWidget {
  const Lesson2({super.key});

  @override
  State<Lesson2> createState() => _Lesson2();
}

class _Lesson2 extends State<Lesson2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int selectedOption = -1;

    var questions = [
      {
        "question":
            "Graph A shows a linear function, and graph B shows an exponential function.",
        "answers": [
          "true",
          "false",
        ],
        "correctAnswer": 0,
      },
    ];

    Widget buildQuizScreen({
      required int questionNumber,
      Widget? image,
    }) {
      List<String> answers =
          questions[questionNumber]["answers"] as List<String>;
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
                "Lesson 2",
                style: TextStyle(
                  fontSize: size.width / 10,
                ),
              ),
              SizedBox(height: size.height / 80),
              Text(
                "Why Should You Invest? continued...",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "During our previous lesson, I explained the first two reasons, as to why it’s worth investing (Beat the inflation; Create Assets), and now I will present the next one :)",
                style: TextStyle(
                  fontSize: size.width / 25,
                ),
              ),
              SizedBox(height: size.height / 20),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: size.height / 100,
              ),
              SizedBox(height: size.height / 20),
              Text(
                "1. The Power of Exponential Growth",
                style: TextStyle(
                  fontSize: size.width / 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 40),
              Text(
                "In high school, you most certainly learned about two main types of functions: we had linear functions and exponential ones - let’s see how much you remember :)",
                style: TextStyle(fontSize: size.height * 0.020),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 0,
              ),
              SizedBox(height: size.height / 10),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    route: const Lesson2(),
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
