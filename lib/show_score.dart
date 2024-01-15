import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart' as xml;
import 'package:flutter/material.dart';
import '../score_axis.dart';

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
  }

  Future<void> initMemory() async {
    meanScores = await getMeanScores();
    setState(() {});
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
                              color: Theme.of(context).colorScheme.onSecondary),
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
                            )
                          ],
                        ),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: size.width / 20),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  scoreAxis(context, widget.yourScore,
                      meanScores[widget.exercise]!, widget.maximum),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    "Do you want to practice this skill in your 30-day program?",
                    style: TextStyle(
                      fontSize: size.width / 20,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.3,
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          tooltip: 'YES',
                          label: Row(
                            children: [
                              Radio<int>(
                                value: 0,
                                groupValue: selectedOption,
                                activeColor: Colors.blue,
                                fillColor:
                                    MaterialStateProperty.all(Colors.white),
                                splashRadius: 25,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              ),
                              Text(
                                "YES",
                                style: TextStyle(fontSize: size.width / 25),
                              ),
                            ],
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
                          onPressed: () {},
                          tooltip: 'NO',
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio<int>(
                                value: 1,
                                groupValue: selectedOption,
                                activeColor: Colors.blue,
                                fillColor:
                                    MaterialStateProperty.all(Colors.white),
                                splashRadius: 25,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              ),
                              Text(
                                "NO",
                                style: TextStyle(fontSize: size.width / 25),
                              )
                            ],
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
                  const Spacer(),
                  Center(
                    child: SizedBox(
                      height: size.height * 0.05,
                      width: size.width * 0.75,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          navigateToPage(widget.page);
                        },
                        tooltip: 'Continue',
                        label: Text(
                          "Continue",
                          style: TextStyle(fontSize: size.width / 16),
                        ),
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          size: size.width / 16,
                        ),
                        backgroundColor: Colors.blue[400],
                        hoverColor: Colors.blue[900],
                        autofocus: true,
                        heroTag: "continue",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                ],
              ),
            ),
    );
  }
}
