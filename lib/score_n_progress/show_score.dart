import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart' as xml;
import 'package:flutter/material.dart';
import 'score_axis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../buttons.dart';

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
    this.clearAllWindows = false,
  });

  final String title;
  final String subtitle;
  final String description;
  final int exercise;
  final double yourScore;
  final double maximum;
  final Widget? page;
  final bool clearAllWindows;

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
      meanScores[exercise] = 0.8 * widget.maximum;
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
                                ? widget.title.toUpperCase()
                                : "${widget.title.toUpperCase()}\n",
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
                  Center(
                    child: SizedBox(
                      height: size.height * 0.05,
                      width: size.width * 0.75,
                      child: RedirectButton(
                        route: widget.page,
                        text: 'Continue',
                        width: size.width,
                        clearAllWindows: widget.clearAllWindows,
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
