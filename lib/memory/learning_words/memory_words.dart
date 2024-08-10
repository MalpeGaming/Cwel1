import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:math';
import 'dart:async';
import 'memory_check.dart';
import 'package:brain_train_app/app_bar.dart';

class MemoryWords extends StatefulWidget {
  final bool initialTest;
  final bool endingTest;

  const MemoryWords({
    this.initialTest = false,
    this.endingTest = false,
    super.key,
  });

  @override
  State<MemoryWords> createState() => _MemoryWordsState();
}

class _MemoryWordsState extends State<MemoryWords> {
  late SharedPreferences prefs;

  List<String> words = [];
  List<String> defs = [];

  static List<Map<String, String>> getRandomElements(
    List<Map<String, String>> list,
  ) {
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

  static Column createPoint(
    List<Map<String, String>> list,
    int idx,
    Size size,
    BuildContext context,
  ) {
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
    List<Map<String, String>> list,
    Size size,
    BuildContext context,
  ) {
    List<Widget> points = [];

    for (int i = 0; i < list.length; ++i) {
      points.add(createPoint(list, i, size, context));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points,
    );
  }

  int _remainingTime = 420;
  late Timer _timer;
  List<Map<String, String>> b1 = [];
  List<Map<String, String>> picked = [];
  String level = "";

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
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Memory2(
                initialTest: widget.initialTest,
                endingTest: widget.endingTest,
                picked,
                defs,
                words,
              ),
            ),
          );
        }
      });
    });
  }

  Future<void> initMemory() async {
    prefs = await SharedPreferences.getInstance();
    level = prefs.getString('level') ?? "pet";
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
      appBar: appBar(context, ""),
      body: picked.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(
                left: size.width / 10,
                right: size.width / 10,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "MEMORY",
                      style: TextStyle(fontSize: 0.08 * size.height),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.02 * size.height),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Exercise 1.1 - Learning",
                            style: TextStyle(fontSize: 0.022 * size.height),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(width: 0.05 * size.width),
                          const Spacer(),
                          Icon(
                            Icons.timer,
                            size: 0.08 * min(size.width, size.height),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            "${_remainingTime.toString()}s",
                            style: TextStyle(fontSize: 0.02 * size.height),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.05 * size.height),
                      createPoints(picked, size, context),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
