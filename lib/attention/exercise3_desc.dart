import 'package:flutter/material.dart';
import 'exercise3.dart';

class ThirdAttentionExerciseDesc extends StatefulWidget {
  const ThirdAttentionExerciseDesc({super.key});

  @override
  State<ThirdAttentionExerciseDesc> createState() =>
      _ThirdAttentionExerciseDesc();
}

class _ThirdAttentionExerciseDesc extends State<ThirdAttentionExerciseDesc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          margin: EdgeInsets.only(
              left: size.width / 10,
              right: size.width / 10,
              top: size.height / 20,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text("ATTENTION",
                          style: TextStyle(
                            fontSize: size.width / 8,
                          ),
                          textAlign: TextAlign.center,),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Text(
                      "Exercise 3 - Strong Concentration",
                      style: TextStyle(fontSize: size.width / 20),
                    ),
                    SizedBox(
                      height: size.height / 25,
                    ),
                    Text(
                      "In this exercises while doing simple math exercises, you will be listening to dynamic music.",
                      style: TextStyle(fontSize: size.width / 24),
                    ),
                    SizedBox(
                      height: size.height / 25,
                    ),
                    Text(
                      "Turn the volume up.",
                      style: TextStyle(fontSize: size.width / 24),
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                  ],),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThirdAttentionExercise(),
                        ),
                      );
                    },
                    tooltip: 'Continue',
                    label: Text(
                      "Continue",
                      style: TextStyle(fontSize: size.width / 16),
                    ),
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      size: size.width / 16,
                    ),
                    backgroundColor: Colors.blue[400],
                    hoverColor: Colors.blue[900],
                    autofocus: true,
                    heroTag: "continue",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
