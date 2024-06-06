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
              SizedBox(height: size.height / 60),
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
              SizedBox(height: size.height / 60),
              Text(
                "Exercise 1",
                style: TextStyle(
                  fontSize: size.width / 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Graph (A) shows a linear function, and graph (B) shows an exponential function.",
                style: TextStyle(fontSize: size.height * 0.020),
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
