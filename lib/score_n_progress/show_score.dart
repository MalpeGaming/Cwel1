import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart' as xml;
import 'package:flutter/material.dart';
import 'score_axis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '/buttons.dart';

class ShowScore extends StatefulWidget {
  const ShowScore({
    super.key,
    required this.title,
    required this.description,
    required this.exercise,
    required this.yourScore,
    required this.maximum,
    required this.page,
    this.subtitle = "",
  });

  final String title;
  final String subtitle;
  final String description;
  final int exercise;
  final double yourScore;
  final double maximum;
  final Widget? page;

  @override
  State<ShowScore> createState() => _ShowScore();
}

class _ShowScore extends State<ShowScore> {
  int selectedOption = 0;
  late SharedPreferences prefs;

  Future<String> loadAsset() async {
    return await rootBundle
        .loadString('assets/${widget.title.toLowerCase()}/mean_scores.xml');
  }

  Future<Map<int, double>> getMeanScores() async {
    String data = await loadAsset();
    var xdoc = xml.XmlDocument.parse(data);
    Map<int, double> meanScores = {};

    xdoc.findAllElements("mean_score").forEach((element) {
      int exercise =
          int.parse(element.findElements('exercise').first.innerText);
      double score =
          double.parse(element.findElements('score').first.innerText);
      meanScores[exercise] = score;
    });

    return meanScores;
  }

  void navigateToPage(Widget? page) {
    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    }
  }

  Map<int, double> meanScores = {};

  @override
  void initState() {
    super.initState();
    initMemory();
    saveScore();
  }

  Future<void> initMemory() async {
    meanScores = await getMeanScores();
    setState(() {});
  }

  Future<void> saveScore() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setDouble(
      '${widget.title}_${widget.exercise}_initialText',
      widget.yourScore,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: meanScores.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(
                left: size.width / 10,
                right: size.width / 10,
                top: size.height / 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: widget.subtitle.isEmpty
                                ? widget.title
                                : "${widget.title}\n",
                            style: TextStyle(
                              fontSize: size.width / 8,
                            ),
                          ),
                          TextSpan(
                            text: widget.subtitle,
                            style: TextStyle(
                              fontSize: size.width / 16,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: size.width / 22),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  scoreAxis(
                    context,
                    widget.yourScore,
                    meanScores[widget.exercise]!,
                    widget.maximum,
                  ),
                  const Spacer(),
                  Text(
                    "Do you want to practice this skill in your 30-day program?",
                    style: TextStyle(
                      fontSize: size.width / 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.3,
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            navigateToPage(widget.page);
                          },
                          tooltip: 'YES',
                          label: Text(
                            "YES",
                            style: TextStyle(
                              fontSize: size.width / 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.green[500],
                          hoverColor: Colors.green[900],
                          heroTag: "yes",
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 15,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.3,
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            navigateToPage(widget.page);
                          },
                          tooltip: 'NO',
                          label: Text(
                            "NO",
                            style: TextStyle(
                              fontSize: size.width / 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.red[500],
                          hoverColor: Colors.red[900],
                          heroTag: "no",
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                ],
              ),
            ),
    );
  }
}

class ChartDataImprovement {
  ChartDataImprovement(this.day, this.score);
  final String day;
  final double score;
}

class ShowImprovement extends StatefulWidget {
  const ShowImprovement({
    super.key,
    required this.title,
    required this.description,
    required this.exercise,
    required this.yourScore,
    required this.maximum,
    required this.page,
    this.subtitle = "",
  });

  final String title;
  final String subtitle;
  final String description;
  final int exercise;
  final double yourScore;
  final double maximum;
  final Widget page;

  @override
  State<ShowImprovement> createState() => _ShowImprovement();
}

class _ShowImprovement extends State<ShowImprovement>
    with SingleTickerProviderStateMixin {
  int selectedOption = 0;
  late SharedPreferences prefs;
  late List<ChartDataImprovement> chartData = <ChartDataImprovement>[];

  int improvementrate = 0;
  double oldscore = 0;

  void navigateToPage(Widget? page) {
    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    prefs = await SharedPreferences.getInstance();
    oldscore = prefs.getDouble(
          '${widget.title}_${widget.exercise}_initialText',
        ) ??
        0;
    setState(() {
      chartData = [
        ChartDataImprovement("day 1", oldscore),
        ChartDataImprovement("day 30", widget.yourScore),
      ];
      improvementrate = ((widget.yourScore / oldscore - 1) * 100).toInt();
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  children: [
                    TextSpan(
                      text: "Your Progress",
                      style: TextStyle(
                        fontSize: size.width / 8,
                      ),
                    ),
                    TextSpan(
                      text: widget.subtitle,
                      style: TextStyle(
                        fontSize: size.width / 16,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: const NumericAxis(),
              series: <CartesianSeries>[
                LineSeries<ChartDataImprovement, String>(
                  color: Colors.cyan[300],
                  width: 5,
                  dataSource: chartData,
                  xValueMapper: (ChartDataImprovement data, _) => data.day,
                  yValueMapper: (ChartDataImprovement data, _) => data.score,
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
            SizedBox(
              height: size.height / 20,
            ),
            Center(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 0.022 * size.height,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      children: [
                        const TextSpan(
                          text: "You have improved by ",
                        ),
                        TextSpan(
                          text: "$improvementrate%",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Text(
                    "Well Done 🎉",
                    style: TextStyle(
                      fontSize: size.width / 16,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: widget.page,
                  text: 'Continue',
                  width: size.width,
                  clearAllWindows: true,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 10,
            ),
          ],
        ),
      ),
    );
  }
}
