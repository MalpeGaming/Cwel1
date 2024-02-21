import 'package:flutter/material.dart';
import 'memory_words.dart';
import '../buttons.dart';

class Memory extends StatefulWidget {
  final bool? initialTest;
  const Memory({this.initialTest = false, super.key});

  @override
  State<Memory> createState() => _Memory();
}

class _Memory extends State<Memory> {
  bool initialTest = false;

  @override
  void initState() {
    super.initState();
    initialTest = widget.initialTest!;
    print(initialTest);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 0.05 * size.height),
          Align(
            alignment: Alignment.center,
            child: Text(
              "MEMORY",
              style: TextStyle(fontSize: 0.08 * size.height),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 0.02 * size.height),
          Padding(
            padding: EdgeInsets.only(
              left: 0.07 * size.width,
              right: 0.07 * size.width,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Exercise 1 - Learning",
                  style: TextStyle(fontSize: 0.025 * size.height),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 0.02 * size.height),
                Text(
                  "In this exercises you will be given 7 minutes to learn as many words as you can. When you are ready to start, click CONTINUE.",
                  style: TextStyle(fontSize: 0.02 * size.height),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.75,
              child: RedirectButton(
                route: const MemoryWords(),
                text: 'Continue',
                width: size.width,
              ),
            ),
          ),
          SizedBox(height: 0.1 * size.height),
        ],
      ),
    );
  }
}
