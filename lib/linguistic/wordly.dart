import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';
import '../app_bar.dart';

class Wordly extends StatefulWidget {
  const Wordly({super.key, this.testVersion = false});

  final bool testVersion;

  @override
  State<Wordly> createState() => _Wordly();
}

Container createBox(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: 0.15 * size.width,
    width: 0.15 * size.width,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 123, 196, 129),
          Color.fromARGB(255, 95, 187, 103),
        ],
      ),
    ),
  );
}

Row buildLetterRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(
      5,
      (index) => createBox(context),
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
            left: size.width / 10,
            right: size.width / 10,
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
                  SizedBox(
                    height: 0.4 * size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        5,
                        (index) => buildLetterRow(context),
                      ),
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
