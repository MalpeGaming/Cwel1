import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../lesson2/main.dart';

class Lesson1 extends StatefulWidget {
  const Lesson1({super.key});

  @override
  State<Lesson1> createState() => _Lesson1();
}

class _Lesson1 extends State<Lesson1> {
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
                ),
              ),
              SizedBox(height: size.height / 80),
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
                  fontSize: size.width / 25,
                ),
              ),
              SizedBox(height: size.height / 60),
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
                style: TextStyle(fontSize: size.height * 0.020),
              ),
              SizedBox(height: size.height / 60),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 0.020 * size.height,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  children: const [
                    TextSpan(
                      text: "investing",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          "- put (money) into financial schemes, shares, property, or a commercial venture with the expectation of achieving a profit ",
                    ),
                    TextSpan(
                      text: "(Oxford Dictionary)",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 60),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 0.020 * size.height,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  children: const [
                    TextSpan(
                      text: "inflation",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "- the increase of prices over time",
                    ),
                  ],
                ),
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
