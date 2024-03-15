import 'package:flutter/material.dart';
import '/show_score.dart';
import '/progress_screen.dart';

class Problem {
  String content;
  String A;
  String B;
  String C;
  String D;
  int answer;

  Problem({
    required this.content,
    required this.A,
    required this.B,
    required this.C,
    required this.D,
    required this.answer,
  });
}

class ProblemSelection extends StatefulWidget {
  const ProblemSelection({
    super.key,
    this.testVersion = false,
  });

  final bool testVersion;

  @override
  State<ProblemSelection> createState() => _ProblemSelectionState();
}

class _ProblemSelectionState extends State<ProblemSelection> {
  int iteration = 0;
  int? selectedOption;
  double score = 0;
  final List<Problem> problems = [
    Problem(
      content:
          "For a polynomial p(x), the value of p(0) is -2. What is the value of p(x)?",
      A: "x-5 is a factor of p(x)",
      B: "x-2 is a factor of p(x)",
      C: "x+2 is a factor of p(x)",
      D: "The remainder when p(x) is divided by x-3 is -2",
      answer: 3,
    ),
    Problem(
      content:
          "Which of the following is an equivalent form of the equation of the graph shown in the xy-plane above, from which the coordinates of the vertex A can be indentified as constants ?",
      A: "y=(x+3)(x-5)",
      B: "y=(x-3)(x+5)",
      C: "y=x(x-2)-15",
      D: "y=(x-1)^2-16",
      answer: 3,
    ),
    Problem(
      content:
          "Katarina is a botanist studyint the production of pears by two types of pear trees. She noticed that That A trees produced 20% more pears than Type B trees did. Based on Katarina's observation, if the type A trees produced 144 pears, how many pears did the type B trees produce?",
      A: "115",
      B: "120",
      C: "124",
      D: "173",
      answer: 1,
    ),
    Problem(
      content:
          "Alma bought a  a laptop computer at a stre that gave a 20% discount off its original price. The total amout she paid to the cashier was p dlllars, including an 8 percent sales tax on the discounterd price. Which of the following represents the original price of the computer in terms of p?",
      A: "0.88p",
      B: "p/0.88",
      C: "(0.8)(1.08)p",
      D: "p/((0.8)(1.08))",
      answer: 6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ListTile createListTitle(int val, String text) {
      return ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: 0.02 * size.height),
        ),
        leading: Radio<int>(
          value: val,
          groupValue: selectedOption,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
      );
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 40,
          right: size.width / 40,
          top: size.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: size.width / 10,
                right: size.width / 10,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "LOGICAL",
                      style: TextStyle(fontSize: 0.08 * size.height),
                    ),
                    Text(
                      "THINKING",
                      style: TextStyle(fontSize: 0.035 * size.height),
                    ),
                    Text(
                      "Exercise 1 - Math practice",
                      style: TextStyle(fontSize: 0.028 * size.height),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.05 * size.height),
            Container(
              margin: EdgeInsets.only(
                left: size.width / 20,
                right: size.width / 20,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  problems[iteration].content,
                  style: TextStyle(fontSize: 0.02 * size.height),
                ),
              ),
            ),
            createListTitle(0, problems[iteration].A),
            createListTitle(1, problems[iteration].B),
            createListTitle(2, problems[iteration].C),
            createListTitle(3, problems[iteration].D),
            const Spacer(flex: 10),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: FloatingActionButton.extended(
                  //route: Text(widget.content),
                  label: const Text('Continue'),
                  //width: size.width,
                  //requirement: selectedOption != null,
                  onPressed: () {
                    if (iteration < 3) {
                      setState(() {
                        iteration++;
                        selectedOption = -1;
                      });
                      return;
                    }
                    Navigator.pop(context);
                    if (widget.testVersion) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowScore(
                            title: "ATTENTION",
                            description:
                                "Exercise 1 - Short Term Concentration",
                            exercise: 1,
                            yourScore: score,
                            maximum: 10,
                            page: ProblemSelection(
                              testVersion: true,
                            ),
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgressScreen(
                            name: "short_term_concentration",
                            score: score,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
