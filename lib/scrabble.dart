import 'package:flutter/material.dart';
import '/buttons.dart';
import 'dart:math';

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

final List<String> vowels = ['A', 'E', 'I', 'O', 'U', 'Y'];
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
List<int> word = [];

class LetterItem {
  String letter;
  int points;

  LetterItem({
    required this.letter,
    required this.points,
  });
}

class RoundedLetterSquare extends StatefulWidget {
  final int? digit;
  final String letter;
  final bool used;
  final int index;

  const RoundedLetterSquare({
    required this.letter,
    required this.used,
    required this.index,
    this.digit,
    super.key,
  });

  @override
  _RoundedLetterSquareState createState() => _RoundedLetterSquareState();
}

class _RoundedLetterSquareState extends State<RoundedLetterSquare> {
  bool _isUsed = false;

  @override
  void initState() {
    super.initState();
    _isUsed = widget.used;
  }

  void _toggleUsed() {
    setState(() {
      if (!_isUsed) {
        word.add(widget.index);
        _isUsed = !_isUsed;
        print(word);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: _toggleUsed,
      child: Container(
        width: size.width * 0.14,
        height: size.width * 0.14,
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(_isUsed ? 0.5 : 1),
          borderRadius: BorderRadius.circular((size.width * 0.14) / 2.5),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                widget.letter,
                style: TextStyle(
                  fontSize: (size.width * 0.14) / 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            if (widget.digit != null) // Display the digit if it is not null
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    widget.digit.toString(),
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
}

class Scrabble extends StatefulWidget {
  final bool? initialTest;
  const Scrabble({this.initialTest = false, super.key});
  @override
  State<Scrabble> createState() => _Scrabble();
}

class _Scrabble extends State<Scrabble> {
  bool initialTest = false;

  @override
  void initState() {
    super.initState();
    initialTest = widget.initialTest!;
    print(initialTest);
    word.clear();
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
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
          bottom: size.height / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.05 * size.height),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "LINGUISTIC",
                    style: TextStyle(fontSize: 0.07 * size.height),
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
            Wrap(
              children: List.generate(9, (index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: RoundedLetterSquare(
                    letter: picked[index],
                    used: false,
                    index: index,
                  ),
                );
              }),
            ),
            SizedBox(height: 0.04 * size.height),
            Text(word.toString()),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const Text("amogus"),
                  text: 'Continue',
                  width: size.width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
