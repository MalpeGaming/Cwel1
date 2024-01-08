import 'package:flutter/material.dart';
import 'dart:math';
import '../show_score.dart';
import 'memory_video.dart';

class MemoryQuiz extends StatefulWidget {
  final List<Map<String, String>> picked;
  final int score;

  const MemoryQuiz(this.picked, this.score, {super.key});

  @override
  State<MemoryQuiz> createState() => _MemoryQuizState();
}

class _MemoryQuizState extends State<MemoryQuiz> {
  List<Map<String, String>> picked = [];
  int score = 0;
  List<String> defs = [];
  int? selectedOption;
  int questionIndex = 0;
  String word = "";
  String definition = "";

  void check(int selected) {
    if (defs[selected - 1] == definition) ++score;
  }

  void handleContinue() {
    if (questionIndex < 3) {
      if (selectedOption != null) {
        setState(
          () {
            check(selectedOption!);
            selectedOption = null;
            questionIndex++;
            loadQuestion();
          },
        );
      }
    } else {
      print(score);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(score.toString()),
              ],
            ),
          );
        },
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowScore(
            title: "MEMORY",
            description: "Exercise 1 - Learning",
            exercise: 1,
            yourScore: score.toDouble(),
            maximum: 14,
            page: MemoryVideo(picked),
          ),
        ),
      );
    }
  }

  void loadQuestion() {
    List<String> defs2 = [];
    for (int i = 0; i < picked.length - 1; ++i) {
      defs2.add(picked[i].values.toList().first);
    }
    var element = picked[questionIndex];
    word = element.keys.toList().first;
    definition = element.values.toList().first;
    picked.removeAt(questionIndex);
    defs2.removeAt(questionIndex);
    defs = [definition];

    final random = Random();
    for (int i = 0; i < 3; ++i) {
      int idx = random.nextInt(defs2.length);
      var element = defs2[idx];
      defs2.removeAt(idx);
      defs.add(element);
    }
    defs.shuffle();
  }

  ListTile createListTitle(int indx) {
    return ListTile(
      title: Text(defs[indx]),
      leading: Radio<int>(
        value: indx + 1,
        groupValue: selectedOption,
        activeColor: Colors.blue,
        fillColor: MaterialStateProperty.all(Colors.blue),
        splashRadius: 25,
        onChanged: (value) {
          setState(() {
            selectedOption = value;
          });
        },
      ),
    );
  }

  @override
  void initState() {
    picked = widget.picked;
    score = widget.score;
    super.initState();
    loadQuestion();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          margin: EdgeInsets.symmetric(
            horizontal: size.width / 10,
            vertical: size.height / 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Memory",
                      style: TextStyle(fontSize: 0.08 * size.height),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.02 * size.height),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Exercise 1.2 - Learning",
                          style: TextStyle(fontSize: 0.025 * size.height),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 0.02 * size.height),
                        Text(
                          "Choose the definition.",
                          style: TextStyle(fontSize: 0.02 * size.height),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.07 * size.height),
                  Container(
                    height: 0.04 * size.height,
                    width: 0.8 * size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        word,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.03 * size.height),
                  createListTitle(0),
                  createListTitle(1),
                  createListTitle(2),
                  createListTitle(3),
                ],
              ),
              SizedBox(height: 0.05 * size.height),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  onPressed: handleContinue,
                  backgroundColor: Colors.blue[400],
                  hoverColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 0.03 * size.height,
                      color: Colors.white,
                    ),
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
