import 'package:flutter/material.dart';
import '../../app_bar.dart';
import '../../buttons.dart';
import 'sudoku.dart';

class SudokuInfo extends StatefulWidget {
  const SudokuInfo({super.key});
  @override
  State<SudokuInfo> createState() => _SudokuInfo();
}

class _SudokuInfo extends State<SudokuInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
          bottom: size.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "LOGICAL",
                style: TextStyle(fontSize: 0.12 * size.width),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                "THINKING",
                style: TextStyle(fontSize: 0.08 * size.width),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.04 * size.height),
            Text(
              " Exercise 1 - Sudoku",
              style: TextStyle(fontSize: 0.05 * size.width),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 0.04 * size.height),
            RichText(
              text: TextSpan(
                text: 'In this exercise ',
                style: TextStyle(
                  fontSize: size.height / 50,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'time will be measured ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                      text:
                          'as you complete a 9x9 sudoku puzzle. The puzzles will get harder as you progress.',),
                ],
              ),
            ),
            SizedBox(height: 0.02 * size.height),
            RichText(
              text: TextSpan(
                text: 'For each ',
                style: TextStyle(
                  fontSize: size.height / 50,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'correctly filled puzzle ',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  TextSpan(text: 'completed under 15 minutes you will '),
                  TextSpan(
                      text: 'get 1 point, ',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  TextSpan(text: 'for each '),
                  TextSpan(
                      text: 'wrongly filled puzzle ',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  TextSpan(text: 'you will '),
                  TextSpan(
                      text: 'lose 1 point.',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const SudokuGame(),
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
