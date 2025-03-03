import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'settings/tos.dart';

import 'home.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key, required this.title});

  final String title;

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  late SharedPreferences prefs;
  bool firstTime = false;

  Future<void> initData() async {
    prefs = await SharedPreferences.getInstance();
    var plan = prefs.getStringList('basePlanDay1');
    setState(() {
      if (plan == null) {
        firstTime = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 7,
            bottom: size.height / 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "IMPROVE YOUR",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height / 8,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: size.height / 10,
                    fontFamily: 'Horizon',
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('BRAIN'),
                      RotateAnimatedText('MIND'),
                      RotateAnimatedText('BODY'),
                    ],
                    pause: const Duration(milliseconds: 400),
                    repeatForever: true,
                  ),
                ),
              ),
              SizedBox(height: 0.01 * size.height),
              Text(
                "IN 30 DAYS!",
                style: TextStyle(fontSize: size.width / 16),
              ),
              SizedBox(height: 0.05 * size.height),
              Container(
                margin: EdgeInsets.all(size.width / 14.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      blurRadius: 120.0,
                      spreadRadius: 20.0,
                      offset: const Offset(
                        -3.0,
                        -3.0,
                      ),
                    ),
                  ],
                ),
                child: Image.asset('assets/brain_img3.png'),
              ),
              const Spacer(),
              SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: firstTime
                    ? StartButton(
                        text: "Test Yourself!",
                        width: size.width,
                        tooltip: 'Smart Decision!',
                      )
                    : RedirectButton(
                        route: const Home(),
                        text: 'Continue',
                        width: size.width,
                      ),
              ),
              SizedBox(height: 0.02 * size.height),
              if (firstTime)
                RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium, // Use the default body text style

                    children: <TextSpan>[
                      TextSpan(
                        text: "By using our App, you agree to our ",
                        style: TextStyle(
                          fontSize: 0.015 * size.height,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.4),
                        ),
                      ),
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                          decoration:
                              TextDecoration.underline, // Underline decoration
                          fontSize: 0.015 * size.height,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.4),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TermsOfService(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
