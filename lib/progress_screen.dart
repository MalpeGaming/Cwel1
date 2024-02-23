import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'app_bar.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({
    super.key,
    this.points = true,
    required this.name,
    required this.score,
  });

  final bool points;
  final String name;
  final double score;

  @override
  _ProgressScreen createState() => _ProgressScreen();
}

class ChartData {
  ChartData(this.day, this.score);
  final DateTime day;
  final double score;
}

class _ProgressScreen extends State<ProgressScreen> {
  late SharedPreferences prefs;
  late List<ChartData> chartData = <ChartData>[];

  Future<void> initMemory() async {
    prefs = await SharedPreferences.getInstance();
    List<ChartData> newChartData = <ChartData>[];

    List<String> longTermConcentrationTimestamps = prefs.getStringList(
          "${widget.name}_timestamps",
        ) ??
        [];

    List<String> longTermConcentrationScores = prefs.getStringList(
          "${widget.name}_scores",
        ) ??
        [];

    longTermConcentrationTimestamps
        .add(DateTime.now().millisecondsSinceEpoch.toString());
    longTermConcentrationScores.add(widget.score.toString());

    prefs.setStringList(
      "${widget.name}_timestamps",
      longTermConcentrationTimestamps,
    );

    prefs.setStringList(
      "${widget.name}_scores",
      longTermConcentrationScores,
    );

    for (int i = 0; i < longTermConcentrationScores.length; i++) {
      print(
        DateTime.fromMillisecondsSinceEpoch(
          int.parse(longTermConcentrationTimestamps[i]),
        ),
      );
      newChartData.add(
        ChartData(
          DateTime.fromMillisecondsSinceEpoch(
            int.parse(longTermConcentrationTimestamps[i]),
          ),
          double.parse(longTermConcentrationScores[i]),
        ),
      );
    }

    setState(() {
      chartData = newChartData;
    });
  }

  @override
  void initState() {
    super.initState();
    initMemory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 25,
            ),
            Text(
              "CONGRATS",
              style: TextStyle(fontSize: size.width / 8),
            ),
            SizedBox(height: size.height / 18),
            Text(
              "You Received",
              style: TextStyle(
                fontSize: size.width / 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${widget.score.round()} ${widget.points ? 'Points' : 'Percents'}",
              style: TextStyle(
                fontSize: size.width / 15,
                color: const Color.fromARGB(
                  255,
                  145,
                  145,
                  145,
                ),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height / 25),
            Container(
              child: chartData.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : SfCartesianChart(
                      primaryXAxis: const DateTimeAxis(),
                      primaryYAxis: const NumericAxis(),
                      series: <CartesianSeries>[
                        LineSeries<ChartData, DateTime>(
                          color: Colors.cyan[300],
                          width: 5,
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.day,
                          yValueMapper: (ChartData data, _) => data.score,
                          markerSettings: MarkerSettings(
                            isVisible: true,
                            shape: DataMarkerType.circle,
                            color: Colors.cyan[300],
                            width: 12,
                            height: 12,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
