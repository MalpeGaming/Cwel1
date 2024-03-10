import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';
import 'package:dictionaryx/dictionary_msa_json_flutter.dart';
import '../app_bar.dart';

class Hangman extends StatefulWidget {
  const Hangman({super.key, this.testVersion = false});

  final bool testVersion;

  @override
  State<Hangman> createState() => _Hangman();
}

const qwerty = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
];

class _Hangman extends State<Hangman> {
  int act = 0;
  int actRow = 0;
  final guessedKeys = <String>[];
  final guessedKeys2 = <String>[];
  final notGuessedKeys = <String>[];

  final cText = TextEditingController();
  final dMSAJson = DictionaryMSAFlutter();

  Row buildKey(BuildContext context, int row, int indx) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        InkWell(
          onTap: () {
            //tappedKey(context, row, indx);
          },
          child: Container(
            height: 0.055 * size.height,
            width: 0.085 * size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 189, 212, 228),
                  Color.fromARGB(255, 157, 181, 201),
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
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 0.008 * size.width),
      ],
    );
  }

  Future<bool> lookupWord() async {
    String word = "";
    for (int i = 1; i <= 5; ++i) {
      word += letters[(act - act % 6) ~/ 6][i];
    }
    word = word.toLowerCase();
    print(word);
    if (await dMSAJson.hasEntry(word)) {
      return true;
    } else {
      return false;
    }
  }

  List<List<int>> guessed = List.generate(7, (i) => List.generate(6, (j) => 0));

  List<List<String>> letters =
      List.generate(7, (i) => List.generate(7, (j) => ''));

  final wordGenerator = WordGenerator();

  String noun = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    while (noun.length < 7 || noun.length > 10) {
      noun = wordGenerator.randomNoun();
    }
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
                  SizedBox(height: 0.03 * size.height),
                  Center(
                    child: SizedBox(
                      width: 0.7 * size.width,
                      child: Image.asset(
                        'assets/linguistic/hangman/8.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.05 * size.height),
                  Center(
                    child: Text(
                      noun.toUpperCase(),
                      style: TextStyle(
                        fontSize: size.width / 10,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return Column(
                        children: [
                          SizedBox(height: 0.03 * size.height),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              10,
                              (index) => buildKey(context, 0, index),
                            ),
                          ),
                          SizedBox(height: 0.005 * size.height),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              9,
                              (index) => buildKey(context, 1, index),
                            ),
                          ),
                          SizedBox(height: 0.005 * size.height),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              7,
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
