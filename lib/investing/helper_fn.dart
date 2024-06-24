import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../buttons.dart';

Widget keyVocabulary(BuildContext context, String text, String definition) {
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

Column createExercise(
  BuildContext context,
  int questionNumber,
  String question,
  List<String> answers,
  Widget? image,
  Function createListTitle,
) {
  Size size = MediaQuery.of(context).size;
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
        question,
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
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

Widget createDot(
  BuildContext context,
  int usersAnswer,
  Object correct,
  int val,
) {
  Size size = MediaQuery.of(context).size;
  return usersAnswer == val || correct == val
      ? Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width / 30,
          ),
          child: Icon(
            correct == val ? Icons.check_circle : Icons.cancel,
            color: correct == val ? Colors.green : Colors.red,
          ),
        )
      : Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width / 30,
          ),
          child: const Icon(Icons.circle_outlined),
        );
}

Widget createDivider(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      SizedBox(height: size.height / 20),
      Divider(
        color: Theme.of(context).colorScheme.primary,
        thickness: size.height / 200,
      ),
      SizedBox(height: size.height / 20),
    ],
  );
}

Future<void> saveResult(int lessonId, int score) async {
  late SharedPreferences prefs;

  prefs = await SharedPreferences.getInstance();
  prefs.setInt('lesson$lessonId', score);
  //print("amogus");
}

class Success extends StatefulWidget {
  final Widget route;
  const Success({required this.route, super.key});

  @override
  State<Success> createState() => _Success();
}

class _Success extends State<Success> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/investing/success_background.gif"),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Align(
          child: Container(
            margin: EdgeInsets.only(
              left: size.width / 15,
              right: size.width / 15,
              bottom: size.height / 10,
              top: size.height / 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.05 * size.height),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "CONGRATS",
                    style: TextStyle(fontSize: 0.05 * size.height),
                  ),
                ),
                SizedBox(height: 0.03 * size.height),
                Text(
                  "Exercise 1 - Math practice",
                  style: TextStyle(fontSize: 0.025 * size.height),
                ),
                SizedBox(height: 0.04 * size.height),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 0.022 * size.height,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    children: const [
                      TextSpan(
                        text:
                            "In this exercises you will complete part of the ",
                      ),
                      TextSpan(
                        text: "SAT Math with CALCULATOR",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: " Part.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.015 * size.height),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 0.022 * size.height,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    children: const [
                      TextSpan(
                        text: "You will have ",
                      ),
                      TextSpan(
                        text: "350 seconds",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ".",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.015 * size.height),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 0.022 * size.height,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    children: const [
                      TextSpan(
                        text: "When ready click \"",
                      ),
                      TextSpan(
                        text: "CONTINUE\"",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ".",
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                Center(
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: RedirectButton(
                      route: widget.route,
                      text: 'Continue',
                      width: size.width,
                    ),
                  ),
                ),
                //SizedBox(height: 0.1 * size.height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
