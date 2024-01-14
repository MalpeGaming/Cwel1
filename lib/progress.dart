import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'navbar.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _Progress();
}

class _Progress extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
          top: size.height / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "YOUR 30 DAYS",
                    style: TextStyle(
                      fontSize: size.width / 9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    "100% MEANS THAT ALL THE TASKS WERE COMPLETED",
                    style: TextStyle(fontSize: size.width / 22),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.05 * size.height),
            SizedBox(
              width: 0.15 * size.width,
              height: 0.15 * size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "10",
                    style: TextStyle(fontSize: 0.05 * size.width),
                  ),
                  PieChart(
                    PieChartData(
                      startDegreeOffset: 270,
                      sections: [
                        PieChartSectionData(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Color.fromARGB(255, 0, 2, 122),
                              Color.fromARGB(255, 27, 126, 255),
                            ],
                            tileMode: TileMode.mirror,
                          ),
                          radius: 10,
                          value: 20,
                          title: '',
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        PieChartSectionData(
                          radius: 10,
                          value: 80,
                          title: '',
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                    swapAnimationDuration: const Duration(milliseconds: 1000),
                    swapAnimationCurve: Curves.linear,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
