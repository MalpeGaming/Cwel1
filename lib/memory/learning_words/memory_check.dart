import 'package:flutter/material.dart';
import 'memory_quiz.dart';
import '../../buttons.dart';
import '../../app_bar.dart';

class Memory2 extends StatefulWidget {
  final bool initialTest;
  final bool endingTest;

  const Memory2(
    this.picked,
    this.defs,
    this.words, {
    this.initialTest = false,
    this.endingTest = false,
    super.key,
  });

  final List<Map<String, String>> picked;
  final List<String> words;
  final List<String> defs;

  @override
  State<Memory2> createState() => _Memory2();
}

class _Memory2 extends State<Memory2> {
  List<Map<String, String>> picked = [];
  List<String> defs = [];
  List<String> words = [];
  List<String> answers = [];
  int score = 0;

  List<TextEditingController> conList = List.generate(
    10,
    (index) => TextEditingController(),
  );

  SizedBox createFormFields(BuildContext context) {
    List<Widget> formFields = [];
    Size size = MediaQuery.of(context).size;

    for (int i = 0; i < 10; ++i) {
      formFields.add(
        SizedBox(
          height: 0.05 * size.height,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SizedBox(
              width: 0.8 * size.width,
              child: TextFormField(
                controller: conList[i],
                enableSuggestions: false,
                onSaved: (String? value) {},
                onChanged: (String value) {
                  usersInput[i] = conList[i].text;
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: 0.8 * size.width,
      child: Column(
        children: formFields,
      ),
    );
  }

  List<String> usersInput = List.generate(10, (index) => "");

  void handleContinue() {
    setState(() {
      for (int i = 0; i < 10; ++i) {
        if (words.contains(usersInput[i])) ++score;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    picked = widget.picked;
    words = [];

    for (int i = 0; i < 10; ++i) {
      words.add(picked[i].keys.first.toLowerCase());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            bottom: size.height / 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    Text(
                      "Exercise 1.1 - Learning",
                      style: TextStyle(fontSize: 0.025 * size.height),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 0.02 * size.height),
                    Text(
                      "Now write down as many words as you remember. ",
                      style: TextStyle(fontSize: 0.02 * size.height),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 0.02 * size.height),
                createFormFields(context),
                Center(
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: RedirectButton(
                      onClick: handleContinue,
                      route: MemoryQuiz(
                        initialTest: widget.initialTest,
                        endingTest: widget.endingTest,
                        widget.picked,
                        score,
                        usersInput,
                      ),
                      text: 'Continue',
                      width: size.width,
                    ),
                  ),
                ),
                Text(conList[0].text),
                Text(words.toString()),
                Text(usersInput.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
