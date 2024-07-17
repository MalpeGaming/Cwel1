import 'package:flutter/material.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import '../navbar.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});
  @override
  State<Progress> createState() => _Progress();
}

class _Progress extends State<Progress> {
  List<GlobalKey<AnimatedCircularChartState>> keys =
      List.generate(31, (index) => GlobalKey<AnimatedCircularChartState>());

  List<double> summ = List.generate(31, (index) => 60.0);
  List<double> value = List.generate(31, (index) => 60.0);
  List<double> value2 = List.generate(31, (index) => 40.0);
  List<double> value3 = List.generate(31, (index) => 0.0);
  List<double> value32 = List.generate(31, (index) => 60.0);
  Color? labelColor = Colors.blue[200];

  void _increment1(int no) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (summ[no] + value32[no] >= 100) {
          summ[no] += value32[no];
          double x = summ[no] - 100;
          value[no] = summ[no] - x;
        } else {
          value[no] += value32[no];
          value2[no] -= value32[no];
          summ[no] += value32[no];
        }
        List<CircularStackEntry> data = _generateChartData(no);
        keys[no].currentState!.updateData(data);
      });
    });
  }

  void _increment2(int no) {
    Future.delayed(const Duration(milliseconds: 1300), () {
      setState(() {
        if (summ[no] >= 100) {
          value3[no] = summ[no] - 100;
        }
        List<CircularStackEntry> data = _generateChartData(no);
        keys[no].currentState!.updateData(data);
      });
    });
  }

  List<CircularStackEntry> _generateChartData(int dayNum) {
    Color? dialColor = const Color.fromARGB(255, 0, 60, 255);
    Color? dialColor2 = const Color.fromARGB(255, 198, 223, 255);
    Color? dialColor3 = const Color.fromARGB(255, 255, 136, 255);

    List<CircularStackEntry> data = <CircularStackEntry>[
      CircularStackEntry(
        <CircularSegmentEntry>[
          CircularSegmentEntry(
            value3[dayNum],
            dialColor3,
            rankKey: 'percentage3',
          ),
          CircularSegmentEntry(
            value[dayNum],
            dialColor,
            rankKey: 'percentage1',
          ),
          CircularSegmentEntry(
            value2[dayNum],
            dialColor2,
            rankKey: 'percentage4',
          ),
        ],
        rankKey: 'percentage4',
      ),
    ];
    return data;
  }

  @override
  void initState() {
    super.initState();

    _increment1(1);
    _increment2(1);
    for (int i = 1; i <= 30; ++i) {}
  }

  SizedBox buildChart(BuildContext context, int dayNum) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 60,
      height: 60,
      child: AnimatedCircularChart(
        key: keys[dayNum],
        size: const Size(80.0, 80.0),
        initialChartData: _generateChartData(dayNum),
        holeRadius: 10,
        chartType: CircularChartType.Radial,
        edgeStyle: SegmentEdgeStyle.round,
        percentageValues: true,
        holeLabel: dayNum.toString(),
        labelStyle: TextStyle(
          fontSize: 0.022 * size.height,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }

  Column buildChartRow(BuildContext context, int i) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int j = 1; j <= 5; ++j) buildChart(context, (i - 1) * 5 + j),
          ],
        ),
        SizedBox(height: 0.02 * size.height),
      ],
    );
  }

  Column buildChartColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 1; i <= 6; ++i) buildChartRow(context, i),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
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
                      fontWeight: FontWeight.w500,
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
            buildChartColumn(context),

            //buildChart(1, 1),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
