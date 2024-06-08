import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../lesson2/main.dart';

class Lesson1 extends StatefulWidget {
  const Lesson1({super.key});

  @override
  State<Lesson1> createState() => _Lesson1();
}

class _Lesson1 extends State<Lesson1> {
  int selectedOption = -1;

  Widget keyVocabulary(String text, String definition) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.020,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          definition,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.020,
          ),
        ),
      ],
    );
  }

  Widget buildQuizScreen({
    required int questionNumber,
    String? image,
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
        if (image != null) Image.asset(image),
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

  var questions = [
    {
      "question":
          "Below you can see a chart showing the inflation rate in Algeria during a time period of 4 years. Let’s assume an individual holds \$100k in cash at the beginning of the year 2019. How much will his money be worth at the end of the year 2022?",
      "answers": [
        "around \$80.5k",
        "around \$90k",
        "around \$85k",
        "around \$92k",
      ],
      "correctAnswer": 1,
    },
    {
      "question":
          "Buying a house which generates maintenance costs, means it is a/an:",
      "answers": [
        "asset",
        "liability",
      ],
      "correctAnswer": 1,
    },
    {
      "question": "Assets generate income … if you work.",
      "answers": [
        "only",
        "regardless",
      ],
      "correctAnswer": 1,
    },
    {
      "question": "Because of inflation our cash savings … in value.",
      "answers": [
        "increase",
        "decrease",
      ],
      "correctAnswer": 1,
    },
  ];

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
                "Lesson 1",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "Why Should You Invest?",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "You've likely been told many times that you should invest, but have you actually started? In the next 2 lessons, I will provide three convincing arguments that might help you make up your mind on this topic. So, let's begin:",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              Text(
                "1. Beat the Inflation",
                style: TextStyle(
                  fontSize: size.width / 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 40),
              Text(
                "Key vocabulary:",
                style: TextStyle(
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              keyVocabulary(
                "Investing -",
                "putting (money) into financial schemes, shares, property, or a commercial venture with the expectation of achieving a profit (Oxford Dictionary)",
              ),
              SizedBox(height: size.height / 50),
              keyVocabulary("Inflation -", "the increase of prices over time"),
              SizedBox(height: size.height / 30),
              Text(
                "Money, essentially worthless alone, gains value as a medium of exchange for goods and services. A \$10 bill, is worth \$10 dollars because we can buy with it sth that is 10 times more valuable than sth for \$1. Governments regulate the supply of money, often through printing more, but this doesn't create wealth. Increasing the money supply without a corresponding rise in production leads to inflation. This happens because more money chases the same goods and services. For instance, if the government doubles the money supply without boosting production, prices roughly double too. What are the consequences ? Our savings lose value over time, as we can buy less and less with it.",
                style: TextStyle(
                  fontSize: 0.020 * size.height,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              SizedBox(height: size.height / 10),
              buildQuizScreen(
                questionNumber: 0,
                image: "assets/investing/lesson1/algieria.png",
              ),
              SizedBox(height: size.height / 10),
              Text(
                "Alright, but while we can print money, we can't print new stocks of a company, another S&P500 ETF, or another bitcoin. This highlights that investing in assets with real worth protects against inflation. An apple remains an apple, but \$5 won't hold its value after 10 years! :)",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              SizedBox(height: size.height / 10),
              Text(
                "2. Create Assets",
                style: TextStyle(
                  fontSize: size.width / 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 40),
              Text(
                "Key vocabulary:",
                style: TextStyle(
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              keyVocabulary(
                "Asset -",
                "generates money for us; in order to become wealthy we need to have assets",
              ),
              SizedBox(height: size.height / 50),
              keyVocabulary(
                "Liabilities -",
                "takes away money from us; in order to become wealthy we need to have as few liabilities as we can",
              ),
              SizedBox(height: size.height / 10),
              Text(
                "While expanding on this point, I am going to refer to the ideas presented in the book 'Rich Dad, Poor Dad' by Robert Kiyosaki, which I highly recommend reading. : ). Alright, in the book, assets are depicted as anything that puts money in your pocket. Kiyosaki emphasizes the concept of making money work for you by investing in assets (as he said, 'Make money work for you'). These could be stocks of companies, real estate properties, businesses, or other income-generating ventures. Assets are the key to financial independence because they generate passive income and increase in value over time. In simple words, you do nothing, and money flows into your pockets.",
                style: TextStyle(
                  fontSize: size.height * 0.02,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "So now, let’s do a few exercises:",
                style: TextStyle(fontSize: size.height * 0.02),
              ),
              SizedBox(height: size.height / 10),
              buildQuizScreen(
                questionNumber: 1,
              ),
              SizedBox(height: size.height / 10),
              buildQuizScreen(
                questionNumber: 2,
              ),
              SizedBox(height: size.height / 10),
              buildQuizScreen(
                questionNumber: 3,
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
