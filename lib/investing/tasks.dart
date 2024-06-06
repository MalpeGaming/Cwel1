import 'package:flutter/material.dart';

Widget buildQuizScreen({
  required String question,
  required List<String> answers,
  required int correctAnswer,
}) {
  return Column(
    children: [
      Text(
        question,
        style: TextStyle(fontSize: 20),
      ),
      SizedBox(height: 20),
      ListView.builder(
        shrinkWrap: true,
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(answers[index]),
            onTap: () {
              if (index == correctAnswer) {
                // Handle correct answer
                print('Correct answer!');
              } else {
                // Handle wrong answer
                print('Wrong answer!');
              }
            },
          );
        },
      ),
    ],
  );
}
