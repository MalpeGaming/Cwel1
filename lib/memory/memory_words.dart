import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:xml/xml.dart' as xml;
import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'memory_check.dart';

class MemoryWords extends StatefulWidget {
  const MemoryWords({super.key});

  @override
  State<MemoryWords> createState() => _MemoryWordsState();
}

class _MemoryWordsState extends State<MemoryWords> {
  List<String> words = [];
  List<String> defs = [];

  static List<Map<String, String>> getRandomElements(
      List<Map<String, String>> list,) {
    List<Map<String, String>> picked = [];
    for (int i = 0; i < 10; ++i) {
      final random = Random();
      int idx = random.nextInt(list.length);
      var element = list[idx];
      list.removeAt(idx);
      picked.add(element);
    }
    return picked;
  }

  static Column createPoint(List<Map<String, String>> list, int idx, Size size,
      BuildContext context,) {
    var keysList = list[idx].keys.toList();
    var valuesList = list[idx].values.toList();
    var word = keysList.isNotEmpty ? keysList[0] : '';
    var definition = valuesList.isNotEmpty ? valuesList[0] : '';

    return Column(
      children: [
        SizedBox(
          child: RichText(
            softWrap: true,
            text: TextSpan(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 0.02 * size.height,
              ),
              children: [
                TextSpan(text: '${idx + 1}. '),
                TextSpan(
                  text: word,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' - $definition'),
              ],
            ),
          ),
        ),
        SizedBox(height: 0.015 * size.height),
      ],
    );
  }

  Column createPoints(
      List<Map<String, String>> list, Size size, BuildContext context,) {
    List<Widget> points = [];

    for (int i = 0; i < list.length; ++i) {
      points.add(createPoint(list, i, size, context));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points,
    );
  }

  int _remainingTime = 3;
  late Timer _timer;
  List<Map<String, String>> b1 = [];
  List<Map<String, String>> picked = [];
  String level = "";

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

  Future<List<Map<String, String>>> getWordDefinitions() async {
    String data = await rootBundle.loadString('assets/words_n_defs.xml');
    var xdoc = xml.XmlDocument.parse(data);
    List<Map<String, String>> wordDefinitionList = [];

    xdoc.findAllElements(level).forEach(
      (b1Element) {
        b1Element.findAllElements('element').forEach(
          (element) {
            var word = element.findElements('word').first.innerText;
            var definition = element.findElements('definition').first.innerText;

            words.add(word);
            defs.add(definition);
            wordDefinitionList.add({word: definition});
          },
        );
      },
    );

    return wordDefinitionList;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Memory2(picked, defs, words),
            ),
          );
        }
      });
    });
  }

  Future<void> initMemory() async {
    level = await loadLevel();
    b1 = await getWordDefinitions();
    picked = getRandomElements(b1);
    setState(() {});
    startTimer();
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
      body: picked.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: 0.05 * size.height),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "MEMORY",
                    style: TextStyle(fontSize: 0.08 * size.height),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.02 * size.height),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0.07 * size.width, right: 0.07 * size.width,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Exercise 1.1 - Learning",
                            style: TextStyle(fontSize: 0.025 * size.height),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(width: 0.05 * size.width),
                          const Spacer(),
                          Icon(
                            Icons.timer,
                            size: 0.08 * min(size.width, size.height),
                            color: Colors.blue[400],
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            "${_remainingTime.toString()}s",
                            style: TextStyle(fontSize: 0.025 * size.height),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.05 * size.height),
                      createPoints(picked, size, context),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
