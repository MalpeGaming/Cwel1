import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import '../app_bar.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({
    super.key,
    this.points = true,
    required this.name,
    required this.score,
    required this.exercise,
    this.txt = "You Received",
    this.pointAlternative = "Points",
  });

  final bool points;
  final String name;
  final double score;
  final String txt;
  final String pointAlternative;
  final String exercise;

  @override
  _ProgressScreen createState() => _ProgressScreen();
}

class ChartData {
  ChartData(this.day, this.score);
  final DateTime day;
  final double score;
}

class _ProgressScreen extends State<ProgressScreen>
    with SingleTickerProviderStateMixin {
  late SharedPreferences prefs;
  late List<ChartData> chartData = <ChartData>[];
  late ConfettiController _confettiController;
  int day = 0;

  @override
  void initState() {
    super.initState();
    readMemory();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
    _confettiController.play();
  }

  Future<void> readMemory() async {
    await calcDay();
    await initMemory();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  Future<void> calcDay() async {
    DateTime firstDay = DateTime.now();
    DateTime today = DateTime.now();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('beginning_date') != null) {
      firstDay = DateTime.parse(prefs.getString('beginning_date')!);
    }

    setState(() {
      day = today.difference(firstDay).inDays + 1;
    });
  }

  Future<void> initMemory() async {
    prefs = await SharedPreferences.getInstance();
    List<ChartData> newChartData = <ChartData>[];

    List<String> timestamps = prefs.getStringList(
          "${widget.name}_timestamps",
        ) ??
        [];

    List<String> scores = prefs.getStringList(
          "${widget.name}_scores",
        ) ??
        [];

    timestamps.add(DateTime.now().millisecondsSinceEpoch.toString());
    scores.add(widget.score.toString());
    //scores = [];

    prefs.setStringList(
      "${widget.name}_timestamps",
      timestamps,
    );

    prefs.setStringList(
      "${widget.name}_scores",
      scores,
    );

    for (int i = 0; i < scores.length; i++) {
      newChartData.add(
        ChartData(
          DateTime.fromMillisecondsSinceEpoch(
            int.parse(timestamps[i]),
          ),
          double.parse(scores[i]),
        ),
      );
    }

    prefs.setString("${widget.exercise}TickedDay$day", "1");

    setState(() {
      chartData = newChartData;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            appBar(context, ""),
            Positioned.fill(
              top: kToolbarHeight,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                gravity: 0.1,
                emissionFrequency: 0.075,
                numberOfParticles: 100,
                maxBlastForce: 80,
                blastDirection: 1,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                  Colors.yellow,
                  Colors.teal,
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 25,
          right: size.width / 25,
          top: size.height / 25,
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "CONGRATS",
                    style: TextStyle(fontSize: size.width / 8),
                  ),
                  SizedBox(height: size.height / 18),
                  Text(
                    widget.txt,
                    style: TextStyle(
                      fontSize: size.width / 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.score.round()} ${widget.pointAlternative != "Points" ? widget.pointAlternative : (widget.score == 1) ? 'Point' : 'Points'}",
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
                  //Text(day.toString()),
                  //Text(widget.exercise),
                  SizedBox(height: size.height / 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
