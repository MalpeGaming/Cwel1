import 'package:flutter/material.dart';
import '/buttons.dart';

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

class LetterItem {
  String letter;
  int points;
  bool req;

  LetterItem({
    required this.letter,
    required this.points,
    this.req = false,
  });
}

class RoundedLetterSquare extends StatelessWidget {
  final double size;
  final Color color;
  final String letter;
  final int? digit; // New optional argument
  final bool req; // New optional argument

  const RoundedLetterSquare({
    required this.size,
    required this.color,
    required this.letter,
    this.digit, // Initialize the optional argument
    this.req = false, // Initialize the optional argument
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size / 2.5),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              letter,
              style: TextStyle(
                fontSize: size / 2,
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
                  digit.toString(),
                  style: TextStyle(
                    fontSize: size / 3,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
        ],
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
  }

  List<String> payload = [];
  bool display = true;
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

            Draggable<String>(
              data: 'L',
              feedback: RoundedLetterSquare(
                size: size.width * 0.15,
                color: Colors.blue.withOpacity(0.7),
                letter: 'L',
                req: true,
              ),
              childWhenDragging: Container(),
              child: display
                  ? RoundedLetterSquare(
                      size: size.width * 0.15,
                      color: Colors.blue,
                      letter: 'L',
                      req: true,
                    )
                  : SizedBox.shrink(),
            ),

            DragTarget<String>(
              builder: (BuildContext context, List<String?> candidateData,
                  List<dynamic> rejectedData) {
                return Container(
                  width: size.width * 0.15,
                  height: size.width * 0.15,
                  color: Colors.red,
                );
              },
              onWillAccept: (String? data) {
                return true;
              },
              onAccept: (String? data) {
                if (data != null) {
                  setState(() {
                    display = false;
                    payload.add(data);
                    print(payload);
                  });
                }
              },
            ),
            SizedBox(height: 0.04 * size.height),

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
            //SizedBox(height: 0.1 * size.height),
          ],
        ),
      ),
    );
  }
}
