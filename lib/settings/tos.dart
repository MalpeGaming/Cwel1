import 'package:flutter/material.dart';
import '../buttons.dart';

class LogicalThinking extends StatefulWidget {
  final bool? initialTest;
  const LogicalThinking({this.initialTest = false, super.key});

  @override
  State<LogicalThinking> createState() => _LogicalThinking();
}

class _LogicalThinking extends State<LogicalThinking> {
  bool initialTest = false;

  @override
  void initState() {
    super.initState();
    initialTest = widget.initialTest!;
    print(initialTest);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
          bottom: size.height / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("amogus")],
        ),
      ),
    );
  }
}
