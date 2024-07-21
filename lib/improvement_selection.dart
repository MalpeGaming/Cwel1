import 'package:brain_train_app/buttons.dart';
import 'package:flutter/material.dart';
import 'attention/short_term_concentration.dart';
import 'memory/learning_words/memory.dart';
import 'logical_thinking/logical_thinking.dart';
import 'linguistic/listening_comprehension_video.dart';

class ImprovementSelection extends StatefulWidget {
  const ImprovementSelection({super.key});

  @override
  State<ImprovementSelection> createState() => _ImprovementSelectionState();
}

class _ImprovementSelectionState extends State<ImprovementSelection> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WHAT WOULD YOU LIKE TO IMPROVE?",
              style: TextStyle(
                fontSize: size.width / 13,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 0.03 * size.height),
            Text(
              "When you click on the button, you will be transported to the specific quiz part.",
              style: TextStyle(fontSize: size.width / 23),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 0.01 * size.height),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: size.width / 23,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                children: const <TextSpan>[
                  TextSpan(text: 'You can '),
                  TextSpan(
                    text: 'only choose 1 SKILL per cycle',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ImprovementButton(
              text: "Memory",
              width: size.width,
              route: const Memory(
                initialTest: true,
              ),
              img: (Theme.of(context).brightness == Brightness.light)
                  ? "memory_light.png"
                  : "memory_dark.png",
              name: "memory",
            ),
            const Spacer(),
            ImprovementButton(
              text: "Attention",
              width: size.width,
              route: const ShortTermConcentration(
                initialTest: true,
              ),
              img: (Theme.of(context).brightness == Brightness.light)
                  ? "attention_light.png"
                  : "attention_dark.png",
              name: "attention",
            ),
            const Spacer(),
            ImprovementButton(
              text: "Linguistic",
              width: size.width,
              route: const ListeningComprehensionVideo(initialTest: true),
              img: (Theme.of(context).brightness == Brightness.light)
                  ? "linguistic_light.png"
                  : "linguistic_dark.png",
              name: "linguistic",
            ),
            const Spacer(),
            ImprovementButton(
              text: "Logical Thinking",
              width: size.width,
              route: const LogicalThinking(
                initialTest: true,
              ),
              //const RiddlesTest( exerciseId: 1,),
              img: (Theme.of(context).brightness == Brightness.light)
                  ? "logical_light.png"
                  : "logical_dark.png",
              name: "logical",
            ),
            const Spacer(),
            ImprovementButton(
              text: "Just fun",
              width: size.width,
              route: const LogicalThinking(
                initialTest: true,
              ),
              //const RiddlesTest( exerciseId: 1,),
              img: (Theme.of(context).brightness == Brightness.light)
                  ? "fun_light.png"
                  : "fun_dark.png",
              name: "games",
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
