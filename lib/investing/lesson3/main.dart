import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../lesson4/main.dart';
import '../helper_fn.dart';

class Lesson3 extends StatefulWidget {
  const Lesson3({super.key});

  @override
  State<Lesson3> createState() => _Lesson3();
}

class _Lesson3 extends State<Lesson3> {
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

  var questions = [
    {
      "question": "What is the main difference between gambling and investing?",
      "answers": [
        "Both involve taking risks",
        "Gambling relies on luck, while investing involves informed decisions",
        "Investing always guarantees a profit",
        "Gambling is legal, but investing is not",
      ],
      "correctAnswer": 1,
    },
    {
      "question": "Which of the following is an example of gambling?",
      "answers": [
        "Buying stocks in a reputable company",
        "Betting on the outcome of a sports game",
        "Opening a savings account",
        "Starting a small business1",
      ],
      "correctAnswer": 1,
    },
    {
      "question":
          "How does luck play a role in gambling compared to investing?",
      "answers": [
        "Luck is irrelevant in both gambling and investing",
        "Luck is the sole determinant of success in investing",
        "Luck is a major factor in gambling, but less so in investing",
        "Luck is only important in certain types of gambling, such as card games",
      ],
      "correctAnswer": 2,
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
                "Lesson 3",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "Is investing really gambling?",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "One of the reactions you will often receive, when telling others (especially the older generations) you would like to start investing is that you are “acting stupid, just gambling, and going to lose all your money”. Well, let’s now analyse these claims and see if they hold and truth.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              createDivider(context),
              Text(
                "Key vocabulary:",
                style: TextStyle(
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              keyVocabulary(
                context,
                "Investing -",
                "putting (money) into financial schemes, shares, property, or a commercial venture with the expectation of achieving a profit (Oxford Dictionary)",
              ),
              SizedBox(height: size.height / 50),
              keyVocabulary(
                  context, "Inflation -", "the increase of prices over time"),
              SizedBox(height: size.height / 30),
              Text(
                "Money, essentially worthless alone, gains value as a medium of exchange for goods and services. A \$10 bill, is worth \$10 dollars because we can buy with it sth that is 10 times more valuable than sth for \$1. Governments regulate the supply of money, often through printing more, but this doesn't create wealth. Increasing the money supply without a corresponding rise in production leads to inflation. This happens because more money chases the same goods and services. For instance, if the government doubles the money supply without boosting production, prices roughly double too. What are the consequences ? Our savings lose value over time, as we can buy less and less with it.",
                style: TextStyle(
                  fontSize: 0.020 * size.height,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              createDivider(context),
              buildQuizScreen(
                questionNumber: 0,
              ),
              SizedBox(height: size.height / 10),
              buildQuizScreen(
                questionNumber: 1,
              ),
              SizedBox(height: size.height / 10),
              buildQuizScreen(
                questionNumber: 2,
              ),
              createDivider(context),
              Text(
                "If you still don’t believe in the power of investing then here are three examples that should convince you in the safety of investing:",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              SizedBox(height: size.height / 30),
              Text(
                "1. If you were to buy one S&P 500 ETF in 1928 for 17.5 \$ you would have 3 951 \$ equivalent to 235 \$ today.",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              SizedBox(height: size.height / 30),
              Text(
                "2. If you  bought one share of MBG.DE 10 years ago for 40 euros, you would now have 150 euros. An increase of 350%. On the other hand, if you had kept the money under the mattress, its value would have decreased by 38%.",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              SizedBox(height: size.height / 30),
              Text(
                "3. The average stock market return is about 10% per year for nearly the last century, as measured by the S&P 500 index - meaning that it consistently grows.",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              createDivider(context),
              Text(
                "Alright so now we are closing the first section of our course, and thus here is a short summary quiz for you:",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              SizedBox(height: size.height / 20),
              Text(
                "Final Quiz:",
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
                context,
                "Asset -",
                "generates money for us; in order to become wealthy we need to have assets",
              ),
              SizedBox(height: size.height / 50),
              keyVocabulary(
                context,
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
              createDivider(context),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    route: const Lesson4(),
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
