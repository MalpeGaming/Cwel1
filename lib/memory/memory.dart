import 'package:flutter/material.dart';
import 'memory_words.dart';

class Memory extends StatefulWidget {
  const Memory({super.key});

  @override
  State<Memory> createState() => _Memory();
}

class _Memory extends State<Memory> {
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
                left: 0.07 * size.width, right: 0.07 * size.width,),
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
          Container(
            width: double.infinity,
            padding:
                EdgeInsets.fromLTRB(0.1 * size.width, 0, 0.1 * size.width, 0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MemoryWords(),
                  ),
                );
              },
              backgroundColor: Colors.blue[400],
              hoverColor: Colors.blue[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: 0.03 * size.height,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 0.1 * size.height),
        ],
      ),
    );
  }
}
