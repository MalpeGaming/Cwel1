import 'package:brain_train_app/buttons.dart';
import 'package:brain_train_app/improvement_selection.dart';
import 'package:flutter/material.dart';
import '/show_score.dart';
import '/progress_screen.dart';
import 'riddle.dart';
import 'dart:async';
import 'dart:math';

class Problem {
  String content;
  String A;
  String B;
  String C;
  String D;
  String E;
  int answer;

  Problem({
    required this.content,
    required this.A,
    required this.B,
    required this.C,
    required this.D,
    this.E = "",
    required this.answer,
  });
}

class ProblemSelection extends StatefulWidget {
  const ProblemSelection({
    super.key,
    this.testVersion = false,
    this.riddlesMode = false,
  });

  final bool testVersion;
  final bool riddlesMode;
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
          "For a polynomial p(x), the value of p(3) is -2. Which of the following must be true about p(x)?",
      A: "x-5 is a factor of p(x)",
      B: "x-2 is a factor of p(x)",
      C: "x+2 is a factor of p(x)",
      D: "The remainder when p(x) is divided by x-3 is -2",
      answer: 3,
    ),
    Problem(
      content:
          "Which of the following is an equivalent form of the equation of the graph shown in the xy-plane above, from which the coordinates of the vertex A can be indentified as constants ?",
      A: "y = (x+3)(x-5)",
      B: "y = (x-3)(x+5)",
      C: "y = x(x-2)-15",
      D: "y = (x-1)^2-16",
      answer: 3,
    ),
    Problem(
      content:
          "Katarina is a botanist studying the production of pears by two types of pear trees. She noticed that That A trees produced 20 percent more pears than Type B trees did. Based on Katarina's observation, if the type A trees produced 144 pears, how many pears did the type B trees produce?",
      A: "115",
      B: "120",
      C: "124",
      D: "173",
      answer: 1,
    ),
    Problem(
      content:
          "Alma bought a laptop computer at a store that gave a 20 percent discount off its original price. The total amout she paid to the cashier was p dollars, including an 8 percent sales tax on the discounterd price. Which of the following represents the original price of the computer in terms of p?",
      A: "0.88p",
      B: "p/0.88",
      C: "(0.8)(1.08)p",
      D: "p/((0.8)(1.08))",
      answer: 6,
    ),
  ];

  final List<Problem> riddles = [
    Problem(
      content:
          "The number is smaller than its half and great than its double. The sum of this number and its square is equal to zero. What is this number?",
      A: "-2",
      B: "-1",
      C: "0",
      D: "1",
      E: "2",
      answer: 3,
    ),
    Problem(
      content:
          "In a certain family, there  are exacly six brothers, whose ages in years form a sequence of consecutive natural numbers. Each of the broghers was asked the question, \"how old is the oldest of your brothers?\" They all gave correct answers. Which of the following numbers cannot be the sum of the ages from all the answers?",
      A: "95",
      B: "125",
      C: "167",
      D: "205",
      E: "233",
      answer: 3,
    ),
    Problem(
      content:
          "Lithuanian Duke Jagiełło, upon arriving in Krakow in 1386, distributed amog his accompanying entourage 20 golden coins and 10 silver coins. Each squire received 3 golden conins and 8 silver coins. Each page received 1 golden coin and 5 silver coins. How many people were given gifts?",
      A: "50",
      B: "60",
      C: "72",
      D: "80",
      E: "90",
      answer: 1,
    ),
    Problem(
      content:
          "Along a straight road stands a fence. It was build by driving a certain number of beams vertcally into the ground, and then each pair of adjacent vertical beams was connected by four horizontal beams. Which of the following numbers could be the number of beams in this fence?",
      A: "95",
      B: "96",
      C: "97",
      D: "98",
      E: "99",
      answer: 3,
    ),
  ];

  int _remainingTime = 2137;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
      } else {
        setState(() {
          if (_remainingTime > 0) {
            _remainingTime--;
          } else {
            _timer.cancel();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowScore(
                  title: "Logical Thinking",
                  description: "Exercise 1 - Short Term Concentration",
                  exercise: 1,
                  yourScore: score,
                  maximum: 10,
                  page: const ImprovementSelection(),
                ),
              ),
            );
          }
        });
      }
    });
  }

  Future<void> initMemory() async {
    setState(() {});
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    _remainingTime = (widget.riddlesMode ? 480 : 350);

    initMemory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ListTile createListTitle(int val, String text) {
      return ListTile(
        //dense: true,
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

    List<Problem> currentList = widget.riddlesMode ? riddles : problems;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 15,
            right: size.width / 15,
            top: size.height / 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: size.width / 20,
                  right: size.width / 20,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (widget.riddlesMode
                                ? "Exercise 2 -  Math riddles"
                                : "Exercise 1 - Math practice"),
                            style: TextStyle(fontSize: 0.043 * size.width),
                          ),
                          SizedBox(width: 0.05 * size.width),
                          Icon(
                            Icons.timer,
                            size: 0.08 * min(size.width, size.height),
                            color: Colors.blue[400],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${_remainingTime.toString()}s",
                            style: TextStyle(fontSize: 0.02 * size.height),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.005 * size.height),
              ((iteration == 1 && widget.riddlesMode == false)
                  ? Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 0.8 * size.width,
                        child: Image.asset(
                          'assets/logical thinking/function_plot.png',
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
              SizedBox(height: 0.02 * size.height),
              Text(
                currentList[iteration].content,
                style: TextStyle(fontSize: 0.02 * size.height),
              ),
              SizedBox(height: 0.02 * size.height),
              createListTitle(0, currentList[iteration].A),
              createListTitle(1, currentList[iteration].B),
              createListTitle(2, currentList[iteration].C),
              createListTitle(3, currentList[iteration].D),
              (widget.riddlesMode
                  ? createListTitle(4, currentList[iteration].E)
                  : const SizedBox.shrink()),
              (widget.riddlesMode
                  ? createListTitle(5, "Don't know (0 points)")
                  : const SizedBox.shrink()),
              SizedBox(height: 0.08 * size.height),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    text: 'Continue',
                    width: size.width,
                    requirement: selectedOption != null,
                    onClick: () {
                      if (iteration < 3) {
                        setState(() {
                          iteration++;
                          selectedOption = -1;
                          currentList = widget.riddlesMode ? riddles : problems;
                        });
                        return;
                      }
                      Navigator.pop(context);
                      if (widget.testVersion) {
                        _timer.cancel();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowScore(
                              title: "logical thinking",
                              description:
                                  "Exercise 1 - Short Term Concentration",
                              exercise: 1,
                              yourScore: score,
                              maximum: 10,
                              page: (widget.riddlesMode
                                  ? const ImprovementSelection()
                                  : const Riddles(
                                      initialTest: true,
                                    )),
                            ),
                          ),
                        );
                      } else {
                        _timer.cancel();
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
              SizedBox(height: 0.05 * size.height),
            ],
          ),
        ),
      ),
    );
  }
}
