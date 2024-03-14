import 'package:flutter/material.dart';
import 'strong_concentration_desc.dart';
import '/progress_screen.dart';
import '/show_score.dart';

class LongTermConcentrationTest extends StatefulWidget {
  const LongTermConcentrationTest({super.key, this.initialTest = false});

  final bool initialTest;

  @override
  State<LongTermConcentrationTest> createState() =>
      _LongTermConcentrationTest();
}

class _LongTermConcentrationTest extends State<LongTermConcentrationTest> {
  double score = 0;
  String languageLevel = "";
  int selectedOption = -1, questionIndex = 0;
  List<int> correctAnswers = [3, 1, 1, 2, 0, 1, 1, 1, 3, 2];
  List<String> questions = [
    "Rice contributes to over … of the calories consumed by humans each year.",
    "First came Asian rice, which many plant geneticists believe originated in what's now ….",
    "Around … years ago, nomadic hunters in the region started planting rice seeds.",
    "South American growers also domesticated rice around … years ago.",
    "In India and Nepal, many Hindus mark an infant's transition to solid foods with a ceremony known as …, where the baby tastes rice for the first time.",
    "Rice crop uses over … of the world's irrigation water.",
    "Flooded fields are the perfect breeding grounds for microorganisms known as ….",
    "Methanogens thrive in environments lacking ….",
    "Methanogens produce methane - a greenhouse gas … times more potent than carbon dioxide.",
    "Alternate wetting and drying can cut water use by ….",
  ];
  List<List<String>> answers = [
    ["5%", "10%", "15%", "20%"],
    ["Japan", "China", "India", "Korea"],
    ["12 000", "9 000", "7 000", "5 000"],
    ["9 000", "7 000", "4 000", "3 000"],
    ["Annaprashan", "Yaren", "Samsara", "Yom Kippur"],
    ["half", "a third", "a fourth", "a fifth"],
    ["astrocytes", "methanogens", "propanogens", "langerhans"],
    ["nitrogen", "oxygen", "carbon", "hydrogen"],
    ["5", "10", "15", "25"],
    ["10%", "20%", "30%", "40%"],
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ListTile createListTitle(int val, String text) {
      return ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: 0.025 * size.height),
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "ATTENTION",
                      style: TextStyle(
                        fontSize: size.width / 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "Exercise 2 - Long Term Concentration",
                    style: TextStyle(
                      fontSize: size.width / 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 20, 16, 250),
                    width: size.width * 0.8,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          questions[questionIndex],
                          style: TextStyle(
                            fontSize: size.width / 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  createListTitle(0, answers[questionIndex][0]),
                  createListTitle(1, answers[questionIndex][1]),
                  createListTitle(2, answers[questionIndex][2]),
                  createListTitle(3, answers[questionIndex][3]),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        if (selectedOption == -1) return;

                        if (selectedOption == correctAnswers[questionIndex]) {
                          score += 1;
                        }

                        if (questionIndex < 9) {
                          setState(() {
                            questionIndex += 1;
                            selectedOption = -1;
                          });
                          return;
                        }

                        Navigator.pop(context);

                        if (widget.initialTest) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowScore(
                                title: "ATTENTION",
                                description:
                                    "Exercise 2 - Long Term Concentration",
                                exercise: 2,
                                yourScore: score,
                                maximum: 10,
                                page: const StrongConcentrationDesc(
                                  initialTest: true,
                                ),
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProgressScreen(
                                name: "long_term_concentration",
                                score: score,
                              ),
                            ),
                          );
                        }
                      },
                      tooltip: 'Continue',
                      label: Text(
                        "Continue",
                        style: TextStyle(fontSize: size.width / 16),
                      ),
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        size: size.width / 16,
                      ),
                      backgroundColor: Colors.blue[400],
                      hoverColor: Colors.blue[900],
                      autofocus: true,
                      heroTag: "continue",
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
