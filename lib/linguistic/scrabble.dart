import 'package:flutter/material.dart';
import '/buttons.dart';
import 'dart:math';
import 'package:dictionaryx/dictionary_msa_json_flutter.dart';
import '../score_n_progress/progress_screen.dart';
import '/app_bar.dart';
import '../score_n_progress/show_improvement.dart';

final Map<String, int> scrabblePoints = {
  'A': 1,
  'B': 3,
  'C': 3,
  'D': 2,
  'E': 1,
  'F': 4,
  'G': 2,
  'H': 4,
  'I': 1,
  'J': 8,
  'K': 5,
  'L': 1,
  'M': 3,
  'N': 1,
  'O': 1,
  'P': 3,
  'Q': 10,
  'R': 1,
  'S': 1,
  'T': 1,
  'U': 1,
  'V': 4,
  'W': 4,
  'X': 8,
  'Y': 4,
  'Z': 10,
};

final List<String> vowels = ['A', 'E', 'I', 'O', 'U'];
final List<String> consonants = [
  'B',
  'C',
  'D',
  'F',
  'G',
  'H',
  'J',
  'K',
  'L',
  'M',
  'N',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'V',
  'W',
  'X',
  'Z',
];

class LetterItem {
  String letter;
  int points;

  LetterItem({
    required this.letter,
    required this.points,
  });
}

class Scrabble extends StatefulWidget {
  final int iteration;
  final int allPoints;
  final bool initialTest;
  final bool endingTest;

  const Scrabble({
    required this.iteration,
    required this.allPoints,
    this.initialTest = false,
    this.endingTest = false,
    super.key,
  });
  @override
  State<Scrabble> createState() => _Scrabble();
}

class _Scrabble extends State<Scrabble> {
  final dMSAJson = DictionaryMSAFlutter();

  List usedList = List.generate(9, (index) => false);
  bool wordExists = false;
  int roundPoints = 0;
  List<int> word = [];
  @override
  void initState() {
    super.initState();
  }

  void toggleUnused() {
    setState(() {
      if (word.isNotEmpty) {
        int index = word.removeLast();
        usedList[index] = false;
        roundPoints -= scrabblePoints[picked[index]]!;
        print(word.map((e) => picked[e]).join('').toLowerCase());
        if (word.isNotEmpty) {
          Future<bool> lookupWord() async {
            if (await dMSAJson
                .hasEntry(word.map((e) => picked[e]).join('').toLowerCase())) {
              return true;
            } else {
              return false;
            }
          }

          Future<void> amogus() async {
            wordExists = await lookupWord();
            print(wordExists);
          }

          amogus();
        }
      } else {
        wordExists = false;
      }

      //print(wordExists);
    });
  }

  Widget roundedLetterSquare({
    required String letter,
    required bool used,
    required int index,
    int? digit,
  }) {
    void toggleUsed() {
      setState(() {
        if (!usedList[index]) {
          usedList[index] = true;
          word.add(index);
          roundPoints += scrabblePoints[letter]!;
          print(word.map((e) => picked[e]).join('').toLowerCase());

          if (word.isNotEmpty) {
            Future<bool> lookupWord() async {
              if (await dMSAJson.hasEntry(
                word.map((e) => picked[e]).join('').toLowerCase(),
              )) {
                return true;
              } else {
                return false;
              }
            }

            Future<void> amogus() async {
              wordExists = await lookupWord();
              print(wordExists);
            }

            amogus();
          } else {
            wordExists = false;
          }
        }
      });
    }

    Size size = MediaQuery.of(context).size;
    print(Theme.of(context).brightness == Brightness.dark);
    return GestureDetector(
      onTap: toggleUsed,
      child: Container(
        width: size.width * 0.14,
        height: size.width * 0.14,
        decoration: BoxDecoration(
          color: (!usedList[index]
              ? Theme.of(context).colorScheme.primary
              : (Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFFD4CDF4)
                  : const Color(0xFF231942))),
          borderRadius: BorderRadius.circular((size.width * 0.14) / 2.5),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: (size.width * 0.14) / 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            if (digit != null) // Display the digit if it is not null
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    scrabblePoints[letter].toString(),
                    style: TextStyle(
                      fontSize: (size.width * 0.14) / 3,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget resultLetter({
    required String letter,
  }) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.14,
      height: size.width * 0.14,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular((size.width * 0.14) / 2.5),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              letter,
              style: TextStyle(
                fontSize: (size.width * 0.14) / 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isDragged = false;
  List<String> picked = [
    vowels[Random().nextInt(vowels.length)],
    vowels[Random().nextInt(vowels.length)],
    consonants[Random().nextInt(vowels.length)],
    consonants[Random().nextInt(vowels.length)],
    (scrabblePoints.keys.toList())[Random().nextInt(scrabblePoints.length)],
    (scrabblePoints.keys.toList())[Random().nextInt(scrabblePoints.length)],
    (scrabblePoints.keys.toList())[Random().nextInt(scrabblePoints.length)],
    (scrabblePoints.keys.toList())[Random().nextInt(scrabblePoints.length)],
    (scrabblePoints.keys.toList())[Random().nextInt(scrabblePoints.length)],
  ]..shuffle();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(widget.allPoints);
    return Scaffold(
      appBar: appBar(context, ""),
      body: Column(
        //spacing: 100,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: size.width / 8,
              right: size.width / 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "LINGUISTIC",
                        style: TextStyle(fontSize: 0.06 * size.height),
                      ),
                      Text(
                        "INTELLIGENCE",
                        style: TextStyle(fontSize: 0.035 * size.height),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.03 * size.height),
                Text(
                  "Exercise 1 - Like Scrabbles",
                  style: TextStyle(fontSize: 0.025 * size.height),
                ),
                SizedBox(height: 0.04 * size.height),
                Text(
                  "Points: $roundPoints, ${wordExists ? "Word Exists" : "Word does not exist"}",
                  style: TextStyle(fontSize: 0.02 * size.height),
                ),
                Text(
                  "Attempt: ${widget.iteration}",
                  style: TextStyle(fontSize: 0.02 * size.height),
                ),
                SizedBox(height: 0.03 * size.height),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: size.width / 12,
              right: size.width / 12,
              //bottom: size.height / 10,
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.05 * size.height),
                Column(
                  children: [
                    Wrap(
                      children: List.generate(9, (index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          child: roundedLetterSquare(
                            letter: picked[index],
                            used: false,
                            index: index,
                            digit: 1,
                          ),
                        );
                      }),
                    ),
                    //SizedBox(height: 0.02 * size.height),
                    //Text(word.toString()),
                    //Text(word.map((e) => picked[e]).join('')),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.backspace_rounded),
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () {
                          if (word.isNotEmpty) {
                            toggleUnused();
                          }
                        },
                        iconSize: (size.width *
                            0.12), // Increase the icon size to make it bigger
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        children: List.generate(word.length, (index) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            child: resultLetter(
                              letter: picked[word[index]],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                //izedBox.shrink(),
                //
              ],
            ),
          ),
          const Spacer(),
          (widget.iteration == 10)
              ? Center(
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: RedirectButton(
                      route: ProgressScreen(
                        name: "scrabble",
                        score:
                            (widget.allPoints + (wordExists ? roundPoints : 0))
                                .toDouble(),
                        exercise: 'Scrabble',
                      ),
                      text: 'Continue',
                      width: size.width,
                    ),
                  ),
                )
              : Center(
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: RedirectButton(
                      onClick: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scrabble(
                              iteration: widget.iteration + 1,
                              allPoints: wordExists
                                  ? (widget.allPoints + roundPoints)
                                  : widget.allPoints,
                              initialTest: widget.initialTest,
                              endingTest: widget.endingTest,
                            ),
                          ),
                        );
                      },
                      text: 'Continue',
                      width: size.width,
                    ),
                  ),
                ),
          SizedBox(height: 0.05 * size.height),
        ],
      ),
    );
  }
}
