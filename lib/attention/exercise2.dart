import 'package:any_link_preview/any_link_preview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;
import '../show_score.dart';
import 'exercise3_desc.dart';
import 'dart:async';
import 'dart:io';

class SecondAttentionExercise extends StatefulWidget {
  const SecondAttentionExercise({super.key});

  @override
  State<SecondAttentionExercise> createState() => _SecondAttentionExercise();
}

class _SecondAttentionExercise extends State<SecondAttentionExercise> {
  double score = 0;
  String languageLevel = "";

  Future<String> loadLevel() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;

    String filePath = '$appDocumentsPath/lang_lev.xml';
    String localLevel = "";

    if (!File(filePath).existsSync()) {
      return "";
    }

    String data = File(filePath).readAsStringSync();
    var xdoc = xml.XmlDocument.parse(data);
    localLevel = xdoc.getElement("root")!.getElement("level")!.innerText;
    return localLevel;
  }

  Future<void> initMemory() async {
    languageLevel = await loadLevel();
    setState(() {});
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
              top: size.height / 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text("ATTENTION",
                          style: TextStyle(
                            fontSize: size.width / 8,
                          ),
                          textAlign: TextAlign.center),
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
                                color: Theme.of(context).colorScheme.onPrimary),
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
                            horizontal: 8, vertical: 8),
                        child: TextField(
                          style: TextStyle(fontSize: size.width / 24),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                              String text = newValue.text;
                              if (text.isEmpty) {
                                score = 0;
                                return newValue;
                              }
                              if (int.parse(text) <= 100) {
                                score = double.parse(text);
                                text += "%";
                                return TextEditingValue(
                                    text: text, selection: newValue.selection);
                              }
                              return oldValue;
                            }),
                          ],
                          maxLines: 1,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: "5%"),
                        ),
                      ),
                    ),
                  ]),
              Center(
                heightFactor: 1,
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowScore(
                            title: "ATTENTION",
                            description: "Exercise 2 - Long Term Concentration",
                            exercise: 2,
                            yourScore: score,
                            maximum: 100,
                            page: const ThirdAttentionExerciseDesc(),
                          ),
                        ),
                      );
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
