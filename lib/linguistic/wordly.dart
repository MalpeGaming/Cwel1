import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';
import 'package:dictionaryx/dictionary_msa_json_flutter.dart';
import '../app_bar.dart';
import '../score_n_progress/progress_screen.dart';

class Wordly extends StatefulWidget {
  const Wordly({super.key, this.testVersion = false});

  final bool testVersion;

  @override
  State<Wordly> createState() => _Wordly();
}

const qwerty = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
];

class _Wordly extends State<Wordly> {
  int act = 0;
  int actRow = 0;
  final guessedKeys = <String>[];
  final guessedKeys2 = <String>[];
  final notGuessedKeys = <String>[];

  final cText = TextEditingController();
  final dMSAJson = DictionaryMSAFlutter();

  Container createBox(BuildContext context, int indx) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 0.15 * size.width,
      width: 0.15 * size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: (guessed[(indx - indx % 6) ~/ 6][indx % 6] == 0)
              ? [
                  Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                ]
              : (guessed[(indx - indx % 6) ~/ 6][indx % 6] == 1)
                  ? [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.onPrimary,
                    ]
                  : (guessed[(indx - indx % 6) ~/ 6][indx % 6] == 2)
                      ? [
                          const Color.fromARGB(255, 255, 238, 0),
                          const Color.fromARGB(255, 255, 196, 0),
                        ]
                      : [
                          const Color.fromARGB(255, 0, 231, 19),
                          const Color.fromARGB(255, 0, 192, 16),
                        ],
        ),
      ),
      child: Center(
        child: Text(
          letters[(indx - indx % 6) ~/ 6][indx % 6].toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 0.04 * size.height,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Row buildLetterRow(BuildContext context, int indx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) => createBox(context, 6 * indx + index + 1),
      ),
    );
  }

  InkWell buildKey(BuildContext context, int row, int indx) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        tappedKey(context, row, indx);
      },
      child: Container(
        height: 0.055 * size.height,
        width: (qwerty[row][indx].length == 1)
            ? 0.085 * size.width
            : 0.12 * size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: (guessedKeys.contains(qwerty[row][indx].toUpperCase()))
                ? [
                    const Color.fromARGB(255, 0, 231, 19),
                    const Color.fromARGB(255, 0, 192, 16),
                  ]
                : (guessedKeys2.contains(qwerty[row][indx].toUpperCase()))
                    ? [
                        const Color.fromARGB(255, 255, 238, 0),
                        const Color.fromARGB(255, 255, 196, 0),
                      ]
                    : (notGuessedKeys.contains(qwerty[row][indx].toUpperCase()))
                        ? [
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.5),
                          ]
                        : [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.onPrimary,
                          ],
          ),
        ),
        child: Center(
          child: Text(
            qwerty[row][indx].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: (qwerty[row][indx].length == 1)
                  ? 0.04 * size.width
                  : 0.03 * size.width,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void clickedEnter(int indx) {
    --indx;
    int row = indx ~/ 6;
    String str = noun.toUpperCase();

    setState(() {
      for (int i = 1; i <= 5; ++i) {
        if (str[i - 1] == letters[row][i]) {
          guessed[row][i] = 3;
          guessedKeys.add(str[i - 1]);
        } else if (str.contains(letters[row][i])) {
          guessed[row][i] = 2;
          guessedKeys2.add(letters[row][i]);
        } else {
          guessed[row][i] = 1;
          notGuessedKeys.add(letters[row][i]);
        }
      }
    });
  }

  Future<bool> lookupWord() async {
    String word = "";
    for (int i = 1; i <= 5; ++i) {
      word += letters[(act - act % 6) ~/ 6][i];
    }
    word = word.toLowerCase();
    if (word == noun || act == 35) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProgressScreen(
            name: "wordly",
            score: (6 - act ~/ 6).toDouble(),
            exercise: 'Wordly',
          ),
        ),
      );
    }
    print(word);
    if (await dMSAJson.hasEntry(word)) {
      return true;
    } else {
      return false;
    }
  }

  void tappedKey(BuildContext context, int row, int indx) {
    setState(
      () {
        if (qwerty[row][indx] == "DEL") {
          if (act % 6 > 0) {
            letters[(act - act % 6) ~/ 6][act % 6] = "";
            --act;
          }
        } else if (qwerty[row][indx] == "ENTER") {
          handleEnter();
        } else if (act % 6 == 5 &&
            letters[(act - act % 6) ~/ 6][act % 6] != "") {
        } else if (letters[((act + 1) - (act + 1) % 6) ~/ 6][(act + 1) % 6] ==
            "") {
          if (act % 6 != 5) ++act;
          letters[(act - act % 6) ~/ 6][act % 6] = qwerty[row][indx];
        }
      },
    );
    print(qwerty[row][indx]);
  }

  Future<void> handleEnter() async {
    bool result = await lookupWord();
    if (act % 6 == 5 && result == true) {
      ++act;
      clickedEnter(act);
    }
  }

  List<List<int>> guessed = List.generate(7, (i) => List.generate(6, (j) => 0));

  List<List<String>> letters =
      List.generate(7, (i) => List.generate(7, (j) => ''));

  final wordGenerator = WordGenerator();

  String noun = "";

  @override
  void initState() {
    while (noun.length != 5) {
      noun = wordGenerator.randomNoun();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 30,
            right: size.width / 30,
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
                      "WORDLY",
                      style: TextStyle(
                        fontSize: size.width / 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  /*Text(
                    noun,
                    style: TextStyle(fontSize: size.width / 20),
                  ),*/
                  Builder(
                    builder: (context) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: size.width / 15,
                              right: size.width / 15,
                            ),
                            height: 0.46 * size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                6,
                                (index) => buildLetterRow(context, index),
                              ),
                            ),
                          ),
                          SizedBox(height: 0.08 * size.height),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              10,
                              (index) => buildKey(context, 0, index),
                            ),
                          ),
                          SizedBox(height: 0.005 * size.height),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              9,
                              (index) => buildKey(context, 1, index),
                            ),
                          ),
                          SizedBox(height: 0.005 * size.height),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              9,
                              (index) => buildKey(context, 2, index),
                            ),
                          ),
                        ],
                      );
                    },
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
