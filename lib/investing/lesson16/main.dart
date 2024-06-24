import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../lesson11/main.dart';
import '../helper_fn.dart';
import 'questions.dart';

class Lesson16 extends StatefulWidget {
  const Lesson16({super.key});

  @override
  State<Lesson16> createState() => _Lesson16();
}

class _Lesson16 extends State<Lesson16> {
  int selectedOption = -1;

  Widget buildQuizScreen({
    required int questionNumber,
    Widget? image,
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
                "Lesson 16",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "What are ETFs ?",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              //SizedBox(height: size.height / 60),
              createDivider(context),
              Text(
                "An Exchange-Traded Fund (ETF) is a type of investment fund that, like a stock, is traded on stock exchanges. It holds a collection of assets, which might include stocks, bonds, or commodities, depending on the fund's focus. For instance, an ETF might track the S&P 500 index, meaning it holds stocks from the top 500 companies in the U.S., giving investors broad market exposure through one security. Some ETFs focus on specific sectors like technology or healthcare, while others may follow commodities such as gold. One of the main benefits of investing in ETFs is diversification—owning a broad selection of assets—which reduces risk. Additionally, ETFs offer the flexibility of trading throughout the day, much like stocks, as opposed to mutual funds which are only priced once daily.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              createDivider(context),
              buildQuizScreen(
                questionNumber: 0,
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
                        if (usersAnswers[i] == questions[i]["correctAnswer"]) {
                          score++;
                        }
                      }
                      print("wynik:");
                      print(score);
                      saveResult(12, score);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Lesson11(),
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
    );
  }
}
