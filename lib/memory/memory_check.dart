import 'package:flutter/material.dart';
import 'memory_quiz.dart';
import '../buttons.dart';

class Memory2 extends StatefulWidget {
  const Memory2(this.picked, this.defs, this.words, {super.key});

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
                onSaved: (String? value) {},
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

  @override
  void initState() {
    super.initState();
    picked = widget.picked;
    words = widget.words;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          margin: EdgeInsets.symmetric(
            horizontal: size.width / 10,
            vertical: size.height / 20,
          ),
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
              const Spacer(),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    route: MemoryQuiz(widget.picked, score),
                    text: 'Continue',
                    width: size.width,
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
