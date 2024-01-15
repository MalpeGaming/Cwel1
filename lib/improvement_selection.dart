import 'package:brain_train_app/buttons.dart';
import 'package:flutter/material.dart';
import 'attention/exercise1.dart';
import 'memory/memory.dart';
import 'linguistic/exercise1.dart';

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
            top: size.height / 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("WHAT WOULD YOU LIKE TO IMPROVE?",
                style: TextStyle(
                    fontSize: size.width / 13,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
                textAlign: TextAlign.center),
            SizedBox(height: 0.03 * size.height),
            Text(
                "When you click on the button, you will be transported to the specific quiz part.",
                style: TextStyle(fontSize: size.width / 23),
                textAlign: TextAlign.center),
            SizedBox(height: 0.01 * size.height),
            RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontSize: size.width / 23,
                      color: Theme.of(context).colorScheme.onSecondary),
                  children: const <TextSpan>[
                    TextSpan(text: 'You can '),
                    TextSpan(
                      text: 'only choose 1 SKILL per cycle',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                textAlign: TextAlign.center),
            const Spacer(),
            buildInfoSection(
              "Memory",
              size,
              "memory",
              "assets/memory.png",
              const Memory(),
            ),
            const Spacer(),
            buildInfoSection(
              "Attention",
              size,
              "attention",
              "assets/attention.png",
              const FirstAttentionExercise(),
            ),
            const Spacer(),
            buildInfoSection(
              "Linguistic",
              size,
              "linguisticintelligence",
              "assets/lingint.png",
              const FirstLinguisticExercise(),
            ),
            const Spacer(),
            buildInfoSection(
              "Logical Thinking",
              size,
              "logicalthinking",
              "assets/chess.png",
              const FirstAttentionExercise(),
            ),
            const Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfoSection(
      String text, Size size, String tag, String imagePath, Widget? page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          imagePath,
          width: size.width / 10,
          height: size.width / 10,
        ),
        const Spacer(),
        SizedBox(
          height: size.height * 0.06,
          width: size.width * 0.6,
          child: RedirectButton(
            text: text,
            width: size.width,
            route: page!,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
