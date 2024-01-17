import 'package:flutter/material.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});
  @override
  State<Progress> createState() => _Progress();
}

class _Progress extends State<Progress> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(400.0, 400.0);

  double summ = 60.0;
  double value = 60.0;
  double value2 = 40.0;
  double value3 = 0.0;
  double value32 = 60.0;
  Color? labelColor = Colors.blue[200];

  void _increment1() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (summ + value32 >= 100) {
          summ += value32;
          double x = summ - 100;
          value = summ - x;
        } else {
          value += value32;
          value2 -= value32;
          summ += value32;
        }
        List<CircularStackEntry> data = _generateChartData(value);
        _chartKey.currentState!.updateData(data);
      });
    });
  }

  void _increment2() {
    Future.delayed(const Duration(milliseconds: 1300), () {
      setState(() {
        if (summ >= 100) {
          value3 = summ - 100;
        }
        List<CircularStackEntry> data = _generateChartData(value);
        _chartKey.currentState!.updateData(data);
      });
    });
  }

  List<CircularStackEntry> _generateChartData(double value) {
    Color? dialColor = const Color.fromARGB(255, 0, 60, 255);
    Color? dialColor2 = const Color.fromARGB(255, 198, 223, 255);
    Color? dialColor3 = const Color.fromARGB(255, 255, 136, 255);

    List<CircularStackEntry> data = <CircularStackEntry>[
      CircularStackEntry(
        <CircularSegmentEntry>[
          CircularSegmentEntry(
            value3,
            dialColor3,
            rankKey: 'percentage3',
          ),
          CircularSegmentEntry(
            value,
            dialColor,
            rankKey: 'percentage1',
          ),
          CircularSegmentEntry(
            value2,
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
    _increment1();
    _increment2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percentage Dial'),
      ),
      body: AnimatedCircularChart(
        key: _chartKey,
        size: _chartSize,
        initialChartData: _generateChartData(value),
        holeRadius: 40,
        chartType: CircularChartType.Radial,
        edgeStyle: SegmentEdgeStyle.round,
        percentageValues: true,
        holeLabel: '1',
      ),
    );
  }
}
