

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TodoHomeWidget extends StatelessWidget {
  //todoList

  final List<String> plan;

  const TodoHomeWidget({
    Key? key,
    required this.plan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    //Size size = MediaQuery.sizeOf(context);
    Size size = Size(300, 300);
    return Container(
      width: size.width,
      //width: size.height / 8,
      height: size.height,
      //height: size.height / 8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple, Colors.red ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          //stops: [0.2, 0.6, 1],
        ),
      ),
      child: Column(
        children: [
          Text(
            "To - Do List",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              //fontSize: size.width / 10,
            ),
            textScaleFactor: 3.5,
          ),
          SizedBox(width: size.width / 15, height: size.height / 15),
          for (int i = 0; i < plan.length; i++)
            Text(
              plan[i],
              textScaleFactor: 2,
            ),
        ],
      ),
    );
  }
}