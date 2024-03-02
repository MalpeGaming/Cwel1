import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';
import '../app_bar.dart';

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

Container createBox(BuildContext context, int indx) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: 0.15 * size.width,
    width: 0.15 * size.width,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.green),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 123, 196, 129),
          Color.fromARGB(255, 95, 187, 103),
        ],
      ),
    ),
    child: Text(indx.toString()),
  );
}

Row buildLetterRow(BuildContext context, int indx) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(
      5,
      (index) => createBox(context, 5 * indx + index),
    ),
  );
}

Container buildKey(BuildContext context, int row, int indx) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: 0.055 * size.height,
    width:
        (qwerty[row][indx].length == 1) ? 0.08 * size.width : 0.12 * size.width,
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
  );
}

class _Wordly extends State<Wordly> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final wordGenerator = WordGenerator();

    String noun = "";
    while (noun.length != 5) {
      noun = wordGenerator.randomNoun();
    }

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
                  Text(
                    noun,
                    style: TextStyle(fontSize: size.width / 20),
                  ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
