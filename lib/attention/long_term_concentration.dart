import 'package:shared_preferences/shared_preferences.dart';
import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../show_score.dart';
import 'strong_concentration_desc.dart';
import 'dart:async';

class LongTermConcentration extends StatefulWidget {
  const LongTermConcentration({super.key, this.testVersion = false});

  final bool testVersion;

  @override
  State<LongTermConcentration> createState() => _LongTermConcentration();
}

class _LongTermConcentration extends State<LongTermConcentration> {
  late SharedPreferences prefs;

  double score = 0;
  String languageLevel = "";

  Future<void> initMemory() async {
    prefs = await SharedPreferences.getInstance();

    setState(
      () {
        languageLevel = prefs.getString('level') ?? "pet";
      },
    );
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
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "ATTENTION",
                      style: TextStyle(
                        fontSize: size.width / 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Text(
                    "Exercise 2 - Long Term Concentration",
                    style: TextStyle(fontSize: size.width / 20),
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    "Do the following listening exercise.",
                    style: TextStyle(fontSize: size.width / 24),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  languageLevel.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : AnyLinkPreview(
                          displayDirection: UIDirection.uiDirectionHorizontal,
                          link:
                              "https://app.engxam.com/$languageLevel/listening/1",
                          errorBody: 'Error body',
                          errorTitle: 'Error',
                          backgroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          titleStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          showMultimedia: false,
                        ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    "Write your PERCENTAGE score BELOW.",
                    style: TextStyle(fontSize: size.width / 24),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: size.width / 24),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            String text = newValue.text;
                            if (text.isEmpty) {
                              score = 0;
                              return newValue;
                            }
                            if (int.parse(text) <= 100) {
                              score = double.parse(text);
                              text += "%";
                              return TextEditingValue(
                                text: text,
                                selection: newValue.selection,
                              );
                            }
                            return oldValue;
                          }),
                        ],
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "5%",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                heightFactor: 1,
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      if (widget.testVersion) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowScore(
                              title: "ATTENTION",
                              description:
                                  "Exercise 2 - Long Term Concentration",
                              exercise: 2,
                              yourScore: score,
                              maximum: 100,
                              page: const StrongConcentrationDesc(
                                  testVersion: true),
                            ),
                          ),
                        );
                      } else {
                        List<String> longTermConcentrationTimestamps =
                            prefs.getStringList(
                                  "long_term_concentration_timestamps",
                                ) ??
                                [];

                        List<String> longTermConcentrationScores =
                            prefs.getStringList(
                                  "long_term_concentration_scores",
                                ) ??
                                [];

                        prefs.setStringList(
                          "long_term_concentration_timestamps",
                          longTermConcentrationTimestamps +
                              [DateTime.now().toString()],
                        );

                        prefs.setStringList(
                          "long_term_concentration_scores",
                          longTermConcentrationScores + [score.toString()],
                        );

                        Navigator.pop(context);
                      }
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
            ],
          ),
        ),
      ),
    );
  }
}
