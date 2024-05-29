import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import 'package:brain_train_app/logical_thinking/problem.dart';

class Investing extends StatefulWidget {
  const Investing({super.key});

  @override
  State<Investing> createState() => _Investing();
}

class _Investing extends State<Investing> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/investing/investing_start.png'),
            Container(
              margin: EdgeInsets.only(
                left: size.width / 10,
                right: size.width / 10,
                top: size.height / 40,
                bottom: size.height / 30,
              ),
              child: Text(
                "Introduction to Investing",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You Will Learn:",
                    style: TextStyle(
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "- What are stocks, bonds, ETFs, cryptocurrencies.",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                  Text(
                    "- How to choose the best securities and commodities.",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                  SizedBox(height: size.height / 30),
                  Text(
                    "About the course:",
                    style: TextStyle(
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height / 50),
                  Text(
                    "- 5-7 hours",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                  Text(
                    "- 318 questions",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                  Text(
                    "- certificate from 90%",
                    style: TextStyle(
                      fontSize: size.width / 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height / 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About the course:",
                    style: TextStyle(
                      fontSize: size.width / 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "- 5-7 hours",
                    style: TextStyle(
                      fontSize: size.width / 20,
                    ),
                  ),
                  Text(
                    "- 318 questions",
                    style: TextStyle(
                      fontSize: size.width / 20,
                    ),
                  ),
                  Text(
                    "- certificate from 90%",
                    style: TextStyle(
                      fontSize: size.width / 20,
                    ),
                  ),
                ],
              ),
            ),
            RedirectButton(
              route: const ProblemSelection(
                testVersion: true,
              ),
              text: 'Continue',
              width: size.width,
            ),
          ],
        ),
      ),
    );
  }
}
