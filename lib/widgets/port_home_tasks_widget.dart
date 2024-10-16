

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PortHomeTasksWidget extends StatelessWidget {
  //todoList

  final List<String> plan;
  final List<String> basePlanTicked;
  final Map<String, String> sectionNames;

  const PortHomeTasksWidget({
    Key? key,
    required this.plan,
    required this.basePlanTicked,
    required this.sectionNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    //Size size = MediaQuery.sizeOf(context);
    Size size = Size(400, 400);
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
          SizedBox(height: size.height / 8),
          Flexible(
            child: Text(
              "To - Do List",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size.width / 6.5,
                fontFamily: "OpenSauceTwo",
              ),
            ),
          ),
          SizedBox(height: size.height / 28),
          for (int i = 0; i < plan.length; i++)
            Padding(padding: EdgeInsets.only(top: 8, bottom: 8, left: size.width / 10),
            child: Row(
              children: [
                SizedBox(
                  width: size.width / 10,
                  height: size.height / 10,
                  child: Icon(
                    size: size.width / 8,
                    basePlanTicked[i] == "1" ? Icons.check_circle_rounded : Icons.circle_outlined,
                    //basePlanTicked[i] == "1" ? "◉" : "○",
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: size.width / 32),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height / 80),
                    child: Text(
                      sectionNames[plan[i]]!,
                      style: TextStyle(
                        fontSize: size.width / 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSauceTwo",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
        ],
      ),
    );
  }
}