import 'package:flutter/material.dart';
import '../app_bar.dart';
import 'package:yaml/yaml.dart';
import 'package:flutter/services.dart';

class ReadingComprehension extends StatefulWidget {
  const ReadingComprehension({super.key, this.initialTest = false});

  final bool initialTest;

  @override
  State<ReadingComprehension> createState() => _ReadingComprehension();
}

class _ReadingComprehension extends State<ReadingComprehension> {
  List<String> questions = [];
  List<List<String>> answers = [];

  void readData() async {
    try {
      List<String> newQuestions = [];
      List<List<String>> newAnswers = [];

      final file = await rootBundle
          .loadString('assets/linguistic/reading_comprehension.yaml');
      final tasks = loadYaml(file)["tests"][0];
      print(tasks[0]["questions"]);
      for (var i = 0; i < tasks[0]["questions"].length; i++) {
        newQuestions.add(tasks[0]["questions"][i]["question"]);
        print('xd');

        newAnswers.add([]);
        for (var answer in tasks[0]["questions"][i]["answers"]) {
          newAnswers[newAnswers.length - 1].add(answer.toString());
        }
      }

      setState(() {
        questions = newQuestions;
        answers = newAnswers;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "MEMORY",
                      style: TextStyle(
                        fontSize: size.width / 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Text(
                    "Exercise 2 -  Working memory ",
                    style: TextStyle(fontSize: size.width / 20),
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    "Follow the instructions in the video.",
                    style: TextStyle(fontSize: size.width / 24),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Text(questions.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
