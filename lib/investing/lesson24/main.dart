import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../menu.dart';

class Lesson24 extends StatefulWidget {
  const Lesson24({super.key});

  @override
  State<Lesson24> createState() => _Lesson24();
}

class _Lesson24 extends State<Lesson24> {
  int selectedOption = -1;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final controller2 = PageController(viewportFraction: 0.8, keepPage: true);

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

  List<List<String>> images = [
    [
      "assets/investing/lesson24/1.png",
      "assets/investing/lesson24/2.png",
      "assets/investing/lesson24/3.png",
    ],
    [
      "assets/investing/lesson24/4.png",
      "assets/investing/lesson24/5.png",
    ],
  ];

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
                "Lesson 24",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "Technical Analysis",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              SizedBox(height: size.height / 20),
              keyVocabulary(
                context,
                "Technical Analysis (TA):",
                "Technical analysis is a methodology for forecasting the future direction of prices by studying past market data, primarily price and volume. TA is based on the belief that price movements follow predictable patterns and trends, which can be identified using various chart patterns and technical indicators.",
              ),
              SizedBox(height: size.height / 30),
              keyVocabulary(
                context,
                "Why Technical Analysis Works to Some Extent:",
                "TA can be effective because it takes into account investor behavior and psychology. Market participants often react in predictable ways to certain patterns and news, creating repeatable trends in price movements. In the case of meme cryptocurrencies, TA can work well since these assets often experience sharp and emotional price movements influenced by social media hype and speculation.",
              ),
              Column(
                children: [
                  SizedBox(
                    height: 0.75 * size.width,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return createRecipe(context, 0, index % 3, images);
                      },
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        type: WormType.thinUnderground,
                      ),
                    ),
                  ),
                ],
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
    );
  }
}
