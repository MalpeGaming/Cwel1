import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../lesson3/main.dart';
import '../helper_fn.dart';

class Lesson4 extends StatefulWidget {
  const Lesson4({super.key});

  @override
  State<Lesson4> createState() => _Lesson4();
}

class _Lesson4 extends State<Lesson4> {
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
      "question": "What does owning a stock represent?",
      "answers": [
        "Ownership in the entire market",
        "Ownership of a portion of a corporation",
        "Responsibility for company debts",
        "A loan to the company",
      ],
      "correctAnswer": 1,
    },
    {
      "question": "What is the primary reason companies issue stocks?",
      "answers": [
        "To give shareholders management control over the company.",
        "To purchase physical assets like office furniture.",
        "To gather funds to run their businesses",
        "To distribute all of their profits to shareholders.",
      ],
      "correctAnswer": 2,
    },
    {
      "question":
          "What protects a shareholder's personal assets when a company goes bankrupt?",
      "answers": [
        "The company's insurance",
        "Government regulations",
        "The legal structure of corporations",
        "The personal bankruptcy of the shareholder",
      ],
      "correctAnswer": 2,
    },
    {
      "question": "Which type of stock usually does not provide voting rights?",
      "answers": [
        "Common stock",
        "Preferred stock",
        "Both offer voting rights",
        "Neither offers voting rights",
      ],
      "correctAnswer": 1,
    },
    {
      "question": "What is the effect of a company issuing new shares?",
      "answers": [
        "It decreases the company's debt immediately",
        "It increases the value of existing shares",
        "It guarantees a profit for all shareholders",
        "It dilutes the ownership percentage of existing shares",
      ],
      "correctAnswer": 3,
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
                "Lesson 4",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "What are stocks ?",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "A stock, also known as equity, represents ownership in part of a corporation, with each unit known as a \"share.\" Owning shares entitles you to a portion of the company’s assets and profits proportional to the amount of stock you own. Stocks are mainly traded on stock exchanges and are a key component of many investors’ portfolios. They must adhere to government regulations that protect investors against fraud.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 0,
              ),
              createDivider(context),
              Text(
                "Companies issue stocks to gather funds to run their businesses. As a shareholder, you don't own the company's physical assets—like office furniture—but you do have a claim on a share of the profits and assets. However, owning shares does not mean you manage the company; that's the role of the board of directors, who aim to increase the company's value, often by hiring executive officers.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 1,
              ),
              createDivider(context),
              Text(
                "The legal structure of corporations limits your liability. If the company fails, its assets can be sold to pay debts, but your personal assets are safe, and you're not required to sell your shares. However, the value of your shares can drop.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 2,
              ),
              createDivider(context),
              Text(
                "As a shareholder, you can vote in company meetings, receive dividends (a dividend is when a company chooses to share a portion of its profits with its shareholders), and sell your shares. The more shares you own, the greater your influence and potential profit share. Stocks come in two main types: common, which typically offer voting rights and dividends, and preferred, which prioritize asset and earnings claims but usually don’t provide voting rights.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 3,
              ),
              createDivider(context),
              Text(
                "Corporations may issue new shares to raise funds, which can dilute existing ownership unless shareholders buy these new shares. Companies might also buy back shares, potentially increasing the value of remaining shares.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 4,
              ),
              SizedBox(height: size.height / 10),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    route: const Lesson3(),
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
