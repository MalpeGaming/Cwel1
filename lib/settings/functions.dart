import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:brain_train_app/title_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '/score_n_progress/show_improvement.dart';
import 'package:brain_train_app/home.dart';

Future<void> popUp(
  BuildContext context,
  String txt,
  String txtBold,
  String txt2,
  String question,
  Function fn,
) async {
  Size size = MediaQuery.of(context).size;
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        scrollable: true,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: txt,
                    style: TextStyle(
                      fontSize: size.width / 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: txtBold,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 20,
                        ),
                      ),
                      TextSpan(text: txt2),
                      TextSpan(text: '\n\n$question'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: SizedBox(
                  width: size.width / 8,
                  child: Center(
                    child: Text(
                      "No",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  fn(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: SizedBox(
                  width: size.width / 8,
                  child: Center(
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void endProgram(BuildContext context) {
  SharedPreferences.getInstance().then((prefs) {
    prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ShowImprovement(
          title: "ATTENTION",
          description: "Exercise 2 - Long Term Concentration",
          exercise: 2,
          yourScore: 1.0,
          maximum: 10,
          page: Home(),
        ),
      ),
    );
  });
}

Future<void> restartAppButton(BuildContext context) async {
  Size size = MediaQuery.of(context).size;
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        scrollable: true,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text:
                        'By restarting the program, you will return to the welcome screen. Your ',
                    style: TextStyle(
                      fontSize: size.width / 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'scores will be lost.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 20,
                        ),
                      ),
                      const TextSpan(text: '\n\nDo you want to continue?'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: SizedBox(
                  width: size.width / 8,
                  child: Center(
                    child: Text(
                      "No",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.clear();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const TitlePage(title: 'The Brain Train App'),
                      ),
                    );
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: SizedBox(
                  width: size.width / 8,
                  child: Center(
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void restartApp(BuildContext context) {
  SharedPreferences.getInstance().then((prefs) {
    prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const TitlePage(title: 'The Brain Train App'),
      ),
    );
  });
}

class Site {
  static void launch() {
    launchUrl(
      Uri.parse(
        "https://braintrain-by-wk.shorthandstories.com/thebraintrainapp/index.html#article",
      ),
    );
  }
}
