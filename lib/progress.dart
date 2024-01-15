import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'navbar.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _Progress();
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class _Progress extends State<Progress> {
  SizedBox buildChart(BuildContext context, int dayNum) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 0.15 * size.width,
      height: 0.15 * size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            dayNum.toString(),
            style: TextStyle(fontSize: 0.01 * size.height),
          ),
          SfCircularChart(
            series: <CircularSeries>[
              RadialBarSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointColorMapper: (ChartData data, _) => data.color,
                cornerStyle: CornerStyle.bothCurve,
                //innerRadius: '50%',
                trackColor: const Color.fromARGB(255, 201, 225, 255),
                animationDuration: 700,
              )
            ],
          ),
        ],
      ),
    );
  }

  Column buildChartRow(BuildContext context, int i) {
    return Column(
      children: [
        Row(
          children: [
            for (int j = 1; j <= 5; ++j) buildChart(context, (i - 1) * 5 + j),
          ],
        ),
      ],
    );
  }

  final List<ChartData> chartData = [
    ChartData('', 38, const Color.fromARGB(255, 0, 175, 44)),
    ChartData('', 25, const Color.fromARGB(255, 0, 66, 189)),
  ];

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
            Column(
              children: [
                for (int i = 1; i <= 6; ++i) buildChartRow(context, i)
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
