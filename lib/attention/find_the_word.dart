import 'package:flutter/material.dart';
import 'package:crossword/crossword.dart';
import 'dart:math';

class FindTheWord extends StatefulWidget {
  const FindTheWord({super.key});

  @override
  State<FindTheWord> createState() => _FindTheWord();
}

class _FindTheWord extends State<FindTheWord> {
  List<String> wordsList = [
    'kot',
    'pies',
    'dom',
    'drzewo',
    'samochód',
    'telefon',
    'komputer',
    'telewizor',
    'kuchnia',
    'łóżko',
    'szafa',
  ];
  int rows = 12; // liczba wierszy
  int cols = 12; // liczba kolumn

  List<List<String>> generateCrossword(
    List<String> wordsList,
    int rows,
    int cols,
  ) {
    List<List<String>> crossword =
        List.generate(rows, (index) => List.filled(cols, ' '));
    Random random = Random();

    for (String word in wordsList) {
      for (int attempt = 0; attempt < 10; attempt++) {
        int startRow = random.nextInt(rows);
        int startCol = random.nextInt(cols);
        bool horizontal = random.nextBool();

        if (canInsertWord(crossword, word, startRow, startCol, horizontal)) {
          for (int i = 0; i < word.length; i++) {
            if (horizontal) {
              crossword[startRow][startCol + i] = word[i];
            } else {
              crossword[startRow + i][startCol] = word[i];
            }
          }
          break;
        }
      }
    }

    return crossword;
  }

  bool canInsertWord(
    List<List<String>> crossword,
    String word,
    int startRow,
    int startCol,
    bool horizontal,
  ) {
    if (horizontal) {
      if (startCol + word.length > crossword[0].length) {
        return false;
      }
      for (int i = 0; i < word.length; i++) {
        if (crossword[startRow][startCol + i] != ' ' &&
            crossword[startRow][startCol + i] != word[i]) {
          return false;
        }
      }
    } else {
      if (startRow + word.length > crossword.length) {
        return false;
      }
      for (int i = 0; i < word.length; i++) {
        if (crossword[startRow + i][startCol] != ' ' &&
            crossword[startRow + i][startCol] != word[i]) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> crossword = generateCrossword(wordsList, rows, cols);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find The Word"),
      ),
      body: Container(
        width: size.width * 0.9,
        height: size.height * 0.9,
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
          top: size.height / 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CrosswordGrid(crossword: crossword),
          ],
        ),
      ),
    );
  }
}

class CrosswordGrid extends StatelessWidget {
  final List<List<String>> crossword;

  const CrosswordGrid({super.key, required this.crossword});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Crossword(
            letters: crossword,
            spacing: const Offset(30, 30),
            onLineDrawn: (List<String> words) {},
            drawVerticalLine: true,
            drawCrossLine: true,
            drawHorizontalLine: true,
            acceptReversedDirection: true,
            lineDecoration: const LineDecoration(
              lineColors: [
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.red,
                Colors.purple,
                Colors.pink,
              ],
              strokeWidth: 30,
            ),
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),
            hints: const [
              'kot',
              'pies',
              'dom',
              'drzewo',
              'samochód',
              'telefon',
              'komputer',
              'telewizor',
              'kuchnia',
              'łóżko',
              'szafa',
            ],
            allowOverlap: true,
          ),
        ),
      ],
    );
  }
}
